#' Filter out particular module lists from a master list
#'
#' @param module_list either the path to `module_lists.csv` or a
#'     `data.frame`.
#' @param course one of "datascience", "morse", "mathstat", "msc".
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
#' @author Ioannis Kosmidis (aut, cre) \email{ioannis.kosmidis@warwick.ac.uk}
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
    course <- match.arg(course, c("datascience", "morse", "mathstat", "msc"))
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
#' @param keep_URL should we return the URLs of the modules? Default is `TRUE`
#' @param ... currently not used
#'
#' @author Ioannis Kosmidis (aut, cre) \email{ioannis.kosmidis@warwick.ac.uk}
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
        mutate(empty_url = ifelse(rep(keep_URL, nrow(x)), URL == "" | is.na(URL) | Suspended == "Yes",
                                  TRUE),
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


#' Various modes of analyses for module lists
#'
#' @param object an object of class `module_list` as produced by
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
#' @author Ioannis Kosmidis (aut, cre) \email{ioannis.kosmidis@warwick.ac.uk}
#' @export
summary.module_list <- function(object, type = "module_code_xtabs", ...) {
    type <- match.arg(type, c("module_code_xtabs", "word_cloud"))
    if (type == "module_code_xtabs") {
        code <- unique(object$Code)
        department <- substr(code, 0, 2)
        level <- substr(code, 3, 3)
        return(xtabs(~ level + department))
    }
    if (type == "word_cloud") {
        ml <- unique(object$Name)
        wordcloud(ml, ...)
    }
}
