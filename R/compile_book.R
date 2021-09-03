#' Compile a handbook in html and pdf format
#'
#' @param working_dir the directory where the handbook structure is,
#'     i.e. with directories course/md course/html-* and common/md
#'     common/html-*, as created by the script
#'     download_convert_organize_handbook_files.R.
#' @param courses at least one of `"datascience"`, `"morse"`,
#'     `"mathstat"`, `"msc"` indicating which handbook drafts to
#'     compile. Default is `c("datascience", "morse", "mathstat",
#'     "msc")`.
#' @param include_source_names should the draft include notes of what
#'     md file each part of the draft corresponds to? Default is
#'     `FALSE`.
#' @param draft_version should the html version of the handboook have
#'     a "DRAFT" watermark?  Default is `TRUE`
#' @param quiet suppress printing of progress? Default is `TRUE`.
#' 
#' @author Ioannis Kosmidis (aut, cre) \email{ioannis.kosmidis@warwick.ac.uk}
#'
#' @export
compile_book <- function(working_dir,
                         courses = c("datascience", "morse", "mathstat", "msc"),
                         include_source_names = FALSE,
                         quiet = TRUE,
                         draft_version = TRUE) {
    if (!all(courses %in% c("datascience", "morse", "mathstat", "msc")))
        stop("`courses` should be at least one of 'datascience', 'morse', 'mathstat', and 'msc'")
    ml_path <- file.path(working_dir, "module_lists.csv")
    module_lists <- try(read.csv(ml_path))
    if (inherits(module_lists, "try-error")) {
        stop(ml_path, " does not exist")
    }
    books_rmd <- file.path(working_dir, file.path(courses, "Rmd/"))
    config <- file.path(working_dir, "book-config/_bookdown.yml")
    drafts <- file.path(working_dir, paste0("drafts/", paste0(courses, "-handbook")))
    css_files <- dir(file.path(working_dir, "book-config/"), "*.css", full.names = TRUE)
    common_files <- dir(file.path(working_dir, "common/Rmd"), full.names = TRUE)

    for (j in seq_along(courses)) {
        book <- books_rmd[j]
        draft <- drafts[j]
        ## Generate common
        exclude <- grepl(ifelse(courses[j] == "msc", "-BSc", "-MSc"), common_files)
        common_files <- common_files[!exclude]
        exclude <- grepl("0000-", common_files)
        common_files <- common_files[!exclude]
        common_paths <- file.path(book, "9999-common.Rmd")

        ## HTML
        for (j in common_files) {
            if (isTRUE(include_source_names)) {
                cat(note(x = j, type = "BEGIN", color = "red", output_format = "html"), file = common_paths, append = TRUE)
            }
            cat("```{r child ='", j, "'}\n```\n\n", sep = "", file = common_paths, append = TRUE)
            if (isTRUE(include_source_names)) {
                cat(note(x = j, type = "END", color = "red", output_format = "html"), file = common_paths, append = TRUE)
            }
        }
        file.copy(css_files, book)
        file.copy(config, book)
        bookdown::render_book(book,
                              output_format = "bookdown::gitbook",
                              ## config_file = config,
                              output_dir = draft,
                              quiet = quiet)
        file.remove(dir(book, "*.css", full.names = TRUE))
        file.remove(dir(book, "_bookdown.yml", full.names = TRUE))
        file.remove(common_paths)

        ## PDF
        for (j in common_files) {
            if (isTRUE(include_source_names)) {
                cat(note(x = j, type = "BEGIN", color = "red", output_format = "pdf"), file = common_paths, append = TRUE)
            }
            cat("```{r child ='", j, "'}\n```\n\n", sep = "", file = common_paths, append = TRUE)
            if (isTRUE(include_source_names)) {
                cat(note(x = j, type = "END", color = "red", output_format = "pdf"), file = common_paths, append = TRUE)
            }
        }
        file.copy(css_files, book)
        file.copy(config, book)        
        bookdown::render_book(book,
                              output_format = "bookdown::pdf_book",
                              ## config_file = config,
                              output_dir = draft,
                              quiet = quiet)
        file.remove(dir(book, "*.css", full.names = TRUE))
        file.remove(dir(book, "_bookdown.yml", full.names = TRUE))
        file.remove(common_paths)

        ## bookdown::render_book(book,
        ##                       output_format = "bookdown::html_document2",
        ##                       config_file = config)
        
    }
}


## color according to output
note <- function(x, type = "END", color, output_format) {
    type <- match.arg(type, c("END", "BEGIN"))
    switch(output_format,
           pdf = sprintf("\\textcolor{%s}{\\bf \\#\\#\\# %s: %s}\n\n", color, type, x),
           word = sprintf("**\\#\\#\\# %s: %s**\n\n", type, x),
           html = sprintf('<span style="color:%s"><strong>### %s: %s</strong></span>\n\n', color, type, x))
}
