#' Use libcurl to check whether a webpage responds or not
#'
#' @param links a vector of http/https links.
#' @param no_page_response a character string to look for in the
#'     server response that a page does not exist. Default is
#'     "the page you requested could not be found".
#' @param verbose Should we get progress updates? Default is `TRUE`.
#'
#' @export
check_links <- function(links, no_page_response = "the page you requested could not be found",
                        verbose = TRUE) {
    n_links <- length(links)
    errors <- logical(n_links)
    for (j in seq_along(links)) {
        if (verbose) cat("Trying", links[j], "... ")
        fetched_page <- try(curl_fetch_memory(links[j]), silent = TRUE)

        if (inherits(fetched_page, "try-error")) {
            errors[j] <- TRUE
        }
        else {
            content <- fetched_page$content
            chars <- try(rawToChar(content), silent = TRUE)
            if (inherits(chars, "try-error")) {
                content <- content[content != "00"]
                chars <- rawToChar(content)
            }
            errors[j] <- any(grepl(no_page_response, chars))
        }
        if (verbose) cat("Done!\n")
    }
    out <- data.frame(URL = links, response = !errors)
    rownames(out) <- names(links)
    out
}

#' Extract all http and https links form an html file
#'
#' @param path the path to the html file. It can be a URL supplied as a string.
#'
#' @export
get_links_from_html <- function(path) {
    page <- read_html(path)
    page_links <- html_attr(html_nodes(page, "a"), "href")
    unique(page_links[grep("http", page_links)])
}

#' Parity checks for module lists
#'
#' @param module_list an object of class `module_list` as produced by
#'     [`get_module_list`].
#' @param current_session string characterizing the current academic
#'     session. Default is "21/22".
#' @param modules_with_differences module codes to exclude from checks
#'     whether duplicated records have the same infor for "Code",
#'     "Name", "Suspended", "Suspended_Session", "URL", "Notes" and
#'     "Term".
#' @param no_page_response a character string to look for in the
#'     server response that a page does not exist. Default is
#'     "the page you requested could not be found".
#' @param verbose Should we get progress updates? Default is `TRUE`.
#'
#' @export
check_module_list <- function(module_list,
                              current_session = "21/22",
                              modules_with_differences = "EP304",
                              no_page_response = "the page you requested could not be found",
                              verbose = TRUE) {

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

    if (length(modules_with_differences)) {
        res[modules_with_differences] <- TRUE
    }

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

    ## Check whether module pages exist
    unique_modules <- unique(module_list$Code)
    urls <- module_list$URL
    names(urls) <- module_list$Code
    urls <- urls[unique_modules]
    no_url <- urls == ""
    all_modules_have_URLs <- all(!no_url)
    attr(all_modules_have_URLs, "no_url") <- names(which(no_url))

    urls <- urls[!no_url]
    url_checks <- check_links(urls, no_page_response = no_page_response, verbose = verbose)
    all_url_checks <- all(url_checks$response)
    attr(all_url_checks, "url_checks") <- url_checks


    checks <- list(year_is_numeric = is.numeric(module_list$Year),
         ## Check for numeric year
         no_AND_issues_streams = length(grep(" &|& ", module_list$Source)) == 0,
         ## Check that there are no " &", "& " in other streams
         no_AND_issues_term = length(grep(" &|& ", module_list$Term)) == 0,
         ## Check that there are no " &", "& "
         max_code_nchar_is_6 = all_code_length,
         duplicated_codes_have_the_same_info = all_instances,
         suspended_session_is_the_same_in_duplicated_codes = all_susp_res,
         modules_have_correct_suspended_info = all_susp,
         all_modules_have_URLs = all_modules_have_URLs,
         all_urls_respond = all_url_checks)
    class(checks) <- c("module_list_checks", class(checks))
    checks

}

#' @export
print.module_list_checks <- function(x, ...) {
    cat("Course year is numeric for all modules: ")
    cat(x$year_is_numeric, "\n")

    cat("No issues with & separator in MORSE Streams: ")
    cat(x$no_AND_issues_streams, "\n")

    cat("No issues with & separator in Term: ")
    cat(x$no_AND_issues_term, "\n")

    cat("Module codes have maximum 6 characters: ")
    cat(x$max_code_nchar_is_6, "\n")
    if (!x$max_code_nchar_is_6) {
        cat("\tFailed: ")
        cat(names(which(!attr(x$max_code_nchar_is_6, "modules"))), "\n")
    }

    cat("Duplicated modules records have the same basic info: ")
    cat(x$duplicated_codes_have_the_same_info, "\n")
    if (!x$duplicated_codes_have_the_same_info) {
        cat("\tFailed: ")
        cat(names(which(!attr(x$duplicated_codes_have_the_same_info, "modules"))), "\n")
    }

    cat("Suspended session is the same in all duplicated modules: ")
    cat(x$suspended_session_is_the_same_in_duplicated_codes, "\n")
    if (!x$suspended_session_is_the_same_in_duplicated_codes) {
        cat("\tFailed: ")
        cat(names(which(!attr(x$suspended_session_is_the_same_in_duplicated_codes, "modules"))), "\n")
    }

    cat("Suspended and Suspended_Session pairs make sense: ")
    cat(x$modules_have_correct_suspended_info, "\n")
    if (!x$modules_have_correct_suspended_info) {
        cat("\tFailed: ")
        cat(names(which(!attr(x$modules_have_correct_suspended_info, "modules"))), "\n")
    }

    cat("All module have URLs: ")
    cat(x$all_modules_have_URLs, "\n")
    if (!x$all_modules_have_URLs) {
        cat("\tFailed: ")
        cat(attr(x$all_modules_have_URLs, "no_url"), "\n")
    }

    cat("All module web-pages respond: ")
    cat(x$all_urls_respond, "\n")
    if (!x$all_urls_respond) {
        cat("\tFailed: ")
        df <- attr(x$all_urls_respond, "url_checks")
        cat(df$URL[!df$response], "\n")
    }

}



#' Check whether the links in the compiled hanbdooks respond or not
#'
#' @param book_path path to the directory with the compiled version of
#'     the hanbdook.
#'
#' @param no_page_response a character string to look for in the
#'     server response that a page does not exist. Default is
#'     "the page you requested could not be found".
#' @param verbose Should we get progress updates? Default is `TRUE`.
#'
#' @export
check_book_links <- function(book_path,
                             no_page_response = "the page you requested could not be found",
                             verbose = TRUE) {
    htmls <- dir(book_path, "*.html", full.names = TRUE)
    n_htmls <- length(htmls)
    dfs <- as.list(rep(NA, n_htmls))
    names(dfs) <- htmls
    for (i in seq_along(htmls)) {
        current_html <- htmls[i]
        cat("Begin checking links in ", current_html, " ... \n")
        out <- get_links_from_html(current_html)
        checks <- check_links(out, no_page_response = no_page_response, verbose = verbose)
        checks$html <- current_html
        dfs[[i]] <- checks
        cat("End checking links in ", current_html, " ... \n")
    }
    class(dfs) <- c("book_links_check", class(dfs))
    dfs
}

#' @export
print.book_links_check <- function(x, ...) {
    cat("Non existent links:\n")
    print(lapply(x, function(xx) {
        xx[!xx$response, c("URL", "response")]
    }))
}

