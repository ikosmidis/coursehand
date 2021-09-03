#' Convert Rmd files to md and copy the md contents to the clipboard
#'
#' @param Rmd_file the name of the Rmd file to be converted to md.
#' @param course one of "datascience", "morse", "mathstat", "msc" or "common".
#' @param working_dir the path to the working directory.
#' @param clipboard should the contents of the html file be copied to the clipboard? Default is `TRUE`.
#' @param quiet suppress printing of progress? Default is `TRUE`.
#'
#' @author Ioannis Kosmidis (aut, cre) \email{ioannis.kosmidis@warwick.ac.uk}
#'
#' @export
Rmd_to_md <- function(Rmd_file,
                      course,
                      working_dir,
                      clipboard = TRUE,
                      quiet = TRUE) {
    md_dir <- paste(working_dir, "drafts",  "Rmd_to_md", sep = "/")
    if (!dir.exists(md_dir)) {
        dir.create(md_dir, recursive = TRUE)
    }
    ml_path <- file.path(working_dir, "module_lists.csv")
    module_lists <- try(read.csv(ml_path))
    if (inherits(module_lists, "try-error")) {
        stop(ml_path, " does not exist")
    }
    md_file <- paste(md_dir, gsub(".Rmd", ".md", Rmd_file), sep = "/")
    Rmd_file <- paste(working_dir, course, "Rmd", Rmd_file, sep = "/")
    out_format <- rmarkdown::md_document(toc = FALSE,
                                         pandoc_args = "--columns=10000")
    rmarkdown::render(Rmd_file, output_format = out_format, output_file = md_file,
                      quiet = quiet)
    if (isTRUE(clipboard)) {
        o <- try(clipr::write_clip(readr::read_file(md_file)))
        if (inherits(o, "try-error")) {
            cat("failed to copy the contents of",
                md_file,
                "to clipboard :(\n")
        }
        else {
            cat("contents of", md_file, "are in the clipboard!\n")
        }
    }
}

#' Convert Rmd files to html and copy the html contents to the clipboard ready to be pasted on Sitebuilder
#'
#' @param Rmd_file the name of the Rmd file to be converted to html.
#' @param course one of "datascience", "morse", "mathstat", "msc" or "common".
#' @param working_dir the path to the working directory.
#' @param clipboard should the contents of the html file be copied to the clipboard? Default is `TRUE`.
#' @param quiet suppress printing of progress? Default is `TRUE`.
#' @export
Rmd_to_html <- function(Rmd_file,
                        course,
                        working_dir,
                        clipboard = TRUE,
                        quiet = TRUE) {
    Rmd_to_md(Rmd_file, course, working_dir, clipboard = FALSE)
    html_dir <- paste(working_dir, "drafts",  "Rmd_to_html", sep = "/")
    if (!dir.exists(html_dir)) {
        dir.create(html_dir, recursive = TRUE)
    }
    html_file <- paste(html_dir, gsub(".Rmd", ".html", Rmd_file), sep = "/")
    md_file <- paste(working_dir, "drafts", "Rmd_to_md", gsub(".Rmd", ".md", Rmd_file), sep = "/")
    rmarkdown::pandoc_convert(md_file, to = "html", output = html_file, verbose = !quiet)
    if (isTRUE(clipboard)) {
        o <- try(clipr::write_clip(readr::read_file(html_file)))
        if (inherits(o, "try-error")) {
            cat("failed to copy the contents of",
                html_file,
                "to clipboard :(\n")
        }
        else {
            cat("contents of", html_file, "are in the clipboard!\n")
        }
    }
}
