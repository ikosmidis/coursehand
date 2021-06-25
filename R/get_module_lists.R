#' Filter out particular module lists from a master list
#'
#' @param module_list either the path to `module_lists.csv` or a
#'     `data.frame`.
#' @param course one of "datascience", "morse", "mathstat".
#' @param stream either `NA` (default) or one of `"G30A"`, `"G30B"`,
#'     `"G30C"`, `"G30D"`.
#' @param year either 1 (default), 2, 3, or 4.
#' @param list one of `"Core"`, `"List A"`, `"List B"`, `"List C"`,
#'     `"List D"`, `"List E"`, `"List F"`, `"Optional"`.
#' @param bsc either "Yes" (default) or "No", indicating whether the
#'     request is about a list that is available for a BSc course or
#'     not.
#' @param mlevel either "Yes" (default) or "No", indicating whether
#'     the request is about a list that is available for an M-level
#'     course or not.
#' @param everything if `TRUE` all filtering options are bypassed and
#'     the contents of `module_list.csv` or simply `module_list` is
#'     returned. Default is `FALSE`.
#'
#' @author Ioannis Kosmidis [aut, cre] \email{ioannis.kosmidis@warwick.ac.uk}
#'
#' @export
get_module_list <- function(module_list,
                            course = "datascience",
                            stream = NA,
                            year = 1,
                            list = "Core",
                            bsc = "Yes",
                            mlevel = "Yes",
                            everything = FALSE) {
    stopifnot("`year` must be one of `1`, `2`, `3`, `4" = year %in% c(1, 2, 3, 4))
    course <- match.arg(course, c("datascience", "morse", "mathstat"))
    if (!is.na(stream)) {
        stream <- match.arg(stream, c("G30A", "G30B", "G30C", "G30D"))
    }
    list <- match.arg(list, c("Core", paste("List", LETTERS[1:6]), "Optional"))
    bsc <- match.arg(bsc, c("Yes", "No"))
    mlevel <- match.arg(mlevel, c("Yes", "No"))
    if (isTRUE(is.character(module_list))) {
        module_list <- read.csv(module_list, stringsAsFactors = FALSE)
    }
    stopifnot("`module_list` must be either a path to the module lists or a `data.frame`" = isTRUE(is.data.frame(module_list)))
    if (!isTRUE(everything)) {
        if (is.na(stream)) {
            module_list <- module_list %>% filter(Course == course, Year == year, List == list, BSc == bsc, Mlevel == mlevel)
        }
        else {
            module_list <- module_list %>% filter(Course == course, Stream == stream, Year == year, List == list, BSc == bsc, Mlevel == mlevel)
        }
    }
    class(module_list) <- c("module_list", class(module_list))
    module_list
}

#' Print a module list as a markdown pipe table
#'
#' @param x the output of [`get_module_list`]
#' @param include a subset of `"Code"`, `"Name"`, `"CATS"`, `"Term"`,
#'     `"Req"`, `"Source"`
#' @param ... currently not used
#'
#' @author Ioannis Kosmidis [aut, cre] \email{ioannis.kosmidis@warwick.ac.uk}
#'
#' @export
print.module_list <- function(x,
                              include = c("Code", "Name", "CATS", "Term"),
                              keep_URL = TRUE,
                              ...) {
    exists <- all(include %in% c("Code", "Name", "CATS", "Term", "Req", "Source"))
    stopifnot("`include` can include at least one of 'Code', 'Name', 'CATS', 'Term', 'Req', 'Source'" = isTRUE(exists))
    urls <- x$URL
    notes <- x$Notes
    ids <- x$ID
    nams <- x$Name
    dupl <- duplicated(x$ID)
    x <- x %>%
        mutate(empty_url = ifelse(!keep_URL, TRUE, URL == "" | is.na(URL) | Suspended == "Yes"),
               empty_notes = Notes == "" | is.na(Notes),
               Name = ifelse(empty_url, Name, paste0("[", Name, "](", urls, ")")),
               Name = ifelse(empty_notes, Name, paste0(Name, " (", notes, ")")),
               Name = ifelse(Suspended == "No", Name, paste0(Name, " (suspended in ", Suspended_Session, ")")),
               duplicated_ID = duplicated(ID))
    if (isTRUE(nrow(x) > 0)) {
        counter <- 0
        for (i in seq.int(nrow(x))) {
            counter <- counter + 1
            if (dupl[i]) {
                x <- x %>% add_row(Name = "OR", .before = counter)
                counter <- counter + 1
            }
        }
    }
    x <- x[, include, drop = FALSE]
    x <- data.frame(lapply(x, function(z) { gsub("&", ", ", z) }))
    options(knitr.kable.NA = '')
    on.exit(options(knitr.kable.NA = NA))
    print(knitr::kable(x, format = "markdown"))
}

## non-exported function to carr out some basic checks on a master module list
check_module_list <- function(module_list, current_session = "21/22") {

    by_module <- lapply(unique(module_list$Code), function(x) {
        module_list[module_list$Code == x, ]
    })
    to_check <- c("Code", "Name", "Suspended", "Suspended_Session", "URL", "Notes", "Term")

    ## duplicated records have the same info in to_check
    res <- sapply(by_module, function(m) {
        out <- all(duplicated(m[to_check])[-1])
        names(out) <- m$Code[1]
        out
    })
    all_instances <- all(res)
    attr(all_instances, "modules") <- res

    ## Suspended session is the same and equal to current_session in duplicated codes
    susp_res <- sapply(by_module, function(m) {
        out <- m[, "Suspended_Session"] == "" | is.na(m[, "Suspended_Session"])
        out[!out] <- m[!out, "Suspended_Session"] == current_session
        out <- all(out)
        names(out) <- m$Code[1]
        out
    })
    all_susp_res <- all(susp_res)
    attr(all_susp_res, "modules") <- susp_res

    ## Suspended and Suspended_Session pairs make sense
    susp <- sapply(by_module, function(m) {
        suspended <- m[, "Suspended"] == "Yes"
        check1 <- m[suspended, "Suspended_Session"] == current_session
        check2 <- m[!suspended, "Suspended_Session"] == "" | is.na(m[!suspended, "Suspended_Session"])
        out <- all(check1 & check2)
        names(out) <- m$Code[1]
        out
    })
    all_susp <- all(susp)
    attr(all_susp, "modules") <- susp

    ## Module codes have maximum 6 characters
    code_length <- nchar(names(res)) <= 6
    names(code_length) <- names(res)
    all_code_length <- all(code_length)
    attr(all_code_length, "modules") <- code_length

    checks <- list(year_is_numeric = is.numeric(module_list$Year),
         ## Check for numeric year
         no_AND_issues_streams = length(grep(" &|& ", module_list$Source)) == 0,
         ## Check that there are no " &", "& " in other streams
         no_AND_issues_term = length(grep(" &|& ", module_list$Term)) == 0,
         ## Check that there are no " &", "& "
         max_code_nchar_is_6 = all_code_length,
         duplicated_codes_have_the_same_info = all_instances,
         suspended_session_is_the_same_in_duplicated_codes = all_susp_res,
         modules_have_correct_suspended_info = all_susp)
    class(checks) <- c("module_list_checks", class(checks))
    checks

}

#' @export
print.module_list_checks <- function(object, ...) {
    cat("Course year is numeric for all modules: ")
    cat(object$year_is_numeric, "\n")
    cat("No issues with & separator in MORSE Streams: ")
    cat(object$no_AND_issues_streams, "\n")
    cat("No issues with & separator in Term: ")
    cat(object$no_AND_issues_term, "\n")
    cat("Module codes have maximum 6 characters: ")
    cat(object$max_code_nchar_is_6, "\n")
    if (!object$max_code_nchar_is_6) {
        cat(" Failed: ")
        cat(names(which(!attr(object$max_code_nchar_is_6, "modules"))), "\n")
    }
    cat("Duplicated modules records have the same basic info: ")
    cat(object$duplicated_codes_have_the_same_info, "\n")
    if (!object$duplicated_codes_have_the_same_info) {
        cat(" Failed: ")
        cat(names(which(!attr(object$duplicated_codes_have_the_same_info, "modules"))), "\n")
    }
    cat("Suspended session is the same in all duplicated modules: ")
    cat(object$suspended_session_is_the_same_in_duplicated_codes, "\n")
    if (!object$suspended_session_is_the_same_in_duplicated_codes) {
        cat(" Failed: ")
        cat(names(which(!attr(object$suspended_session_is_the_same_in_duplicated_codes, "modules"))), "\n")
    }
    cat("Suspended and Suspended_Session pairs make sense: ")
    cat(object$modules_have_correct_suspended_info, "\n")
    if (!object$modules_have_correct_suspended_info) {
        cat(" Failed: ")
        cat(names(which(!attr(object$modules_have_correct_suspended_info, "modules"))), "\n")
    }




}



#' Various modes of analyses for module lists
#'
#' @param x an object of class `module_list` as produced by
#'     [`get_module_list`].
#' @param type `"module_code_xtabs"` for cross-tabulation of
#'     department and level of the modules in `x` (default), or
#'     `"word_cloud"` for a world cloud of the unique module names in
#'     `x`.
#' @param ... if `type = "word_cloud"` further arguments to be passed
#'     to `wordcloud::wordcloud()`
#'
#' @return
#'
#' If `type = "module_code_xtabs"`, a cross-tabulation of departments
#' and module levels as according to the module coding used at
#' University of Warwick. See
#' \url{https://warwick.ac.uk/fac/sci/statistics/currentstudents/handbooks/morse/modulecodes/}
#' for details.
#'
#' If `type = "word_cloud", then a world cloud of the unique module
#' names in `x` is produced.
#'
#' @author Ioannis Kosmidis [aut, cre] \email{ioannis.kosmidis@warwick.ac.uk}
#' @export
summary.module_list <- function(x, type = "module_code_xtabs", ...) {
    type <- match.arg(type, c("module_code_xtabs", "word_cloud"))
    if (type == "module_code_xtabs") {
        code <- unique(x$Code)
        department <- substr(code, 0, 2)
        level <- substr(code, 3, 3)
        return(xtabs(~ level + department))
    }
    if (type == "word_cloud") {
        ml <- unique(x$Name)
        wordcloud(ml, ...)
    }
}
