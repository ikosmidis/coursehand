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
#' @param bsc either "Yes" (default) or "No", indicating whether the request is about a list that is available for a BSc course or not.
#' @param mlevel either "Yes" (default) or "No", indicating whether the request is about a list that is available for an M-level  course or not.
#' @export
get_module_list <- function(module_list,
                            course = "datascience",
                            stream = NA,
                            year = 1,
                            list = "Core",
                            bsc = "Yes",
                            mlevel = "Yes") {
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
    if (is.na(stream)) {
        out <- module_list %>% filter(Course == course, Year == year, List == list, BSc == bsc, Mlevel == mlevel)
    }
    else {
        out <- module_list %>% filter(Course == course, Stream == stream, Year == year, List == list, BSc == bsc, Mlevel == mlevel)
    }
    class(out) <- c("module_list", class(out))
    out
}

#' Print a module list as a markdown pipe table
#'
#' @param x the output of [`get_module_list`]
#' @param include a subset of `"Code"`, `"Name"`, `"CATS"`, `"Term"`,
#'     `"Req"`, `"Other_Streams"`
#' @param ... currently not used
#'
#' @export
print.module_list <- function(x,
                              include = c("Code", "Name", "CATS", "Term"),
                              ...) {
    exists <- all(include %in% c("Code", "Name", "CATS", "Term", "Req", "Other_Streams"))
    stopifnot("`include` can include at least one of 'Code', 'Name', 'CATS', 'Term', 'Req', 'Other_Streams'" = isTRUE(exists))
    urls <- x$URL
    notes <- x$Notes
    ids <- x$ID
    nams <- x$Name
    dupl <- duplicated(x$ID)
    x <- x %>%
        mutate(empty_url = URL == "",
               empty_notes = Notes == "",
               Name = ifelse(empty_url, Name, paste0("[", Name, "](", urls, ")")),
               Name = ifelse(empty_notes, Name, paste0(Name, " (", notes, ")")),
               Name = ifelse(Suspended == "No", Name, paste0(Name, " (suspended in ", Suspended_Session, ")")),
               duplicated_ID = duplicated(ID))
    counter <- 0
    for (i in seq.int(nrow(x))) {
        counter <- counter + 1
        if (x$duplicated_ID[i]) {
            x <- x %>% add_row(Name = "OR", .before = counter)
            counter <- counter + 1
        }
    }
    x <- x[, include, drop = FALSE]
    x <- data.frame(lapply(x, function(z) { gsub("&", ", ", z) }))
    options(knitr.kable.NA = '')
    on.exit(options(knitr.kable.NA = NA))
    print(knitr::kable(x, format = "markdown"))
}

## non-exported function to carr out some basic checks on a master module list
check_module_list <- function(module_list) {
    c(year_is_numeric = is.numeric(module_list$Year),
      ## Check for numeric year
      no_AND_issues_streams = length(grep(" &| &", module_list$Other_Streams)) == 0,
      ## Check that there are no " &", "& " in other streams
      no_AND_issues_term = length(grep(" &| &", module_list$Term)) == 0,
      ## Check that there are no " &", "& "
      max_code_nchar_is_6 = max(nchar(module_list$Code)) == 6)
}
