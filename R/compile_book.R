#' Compile a handbook in html and pdf format
#'
#' @param working_dir the directory where the handbook structure is,
#'     i.e. with directories course/md course/html-* and common/md
#'     common/html-*, as created by the script
#'     download_convert_organize_handbook_files.R.
#' @param courses at least one of `"datascience"`, `"morse"`,
#'     `"mathstat"`, `"msc"`, `"external"`, "intercalated" indicating which handbook
#'     books to compile. Default is `c("datascience", "morse",
#'     "mathstat", "msc", "external", "intercalated")`.
#' @param include_source_names should the draft include notes of what
#'     md file each part of the draft corresponds to? Default is
#'     `FALSE`.
#' @param draft_version should the html version of the handbook have
#'     a "DRAFT" watermark?  Default is `TRUE`
#' @param compress should the resulting gitbook be compressed. Default
#'     is `TRUE`.
#' @param external_common a vector of character strings; if `courses =
#'     "external"` or "`external`" is in `courses`, then the "common"
#'     sections that will be included in the handbook for external
#'     students are those specified by `external_common`.
#' @param quiet suppress printing of progress? Default is `TRUE`.
#'
#' @details
#'
#' `compile_book` will include the Rmd files in the \code{common/Rmd/}
#' directory as follows:
#'
#' If `courses = "external"` or "`external`" is in `courses`, then the
#' "common" sections that will be included in the handbook for
#' external students are those specified by `external_common`
#'
#' If `courses = "intercalated"` then only the Rmd files under
#' \code{intercalated/Rmd} are included.
#'
#' For the remainder courses:
#'
#' - Any files with filenames that do not contain the strings "-BSc",
#'   "-MSc", or "-EXTERNAL" will appear in all handbooks specified in
#'   the `courses` argument.
#'
#' - Any files that have suffix "-BSc" will appear only in the
#'  `"datascience"`, `"morse"`, `"mathstat"` handbooks; see `courses`
#'  argument.
#'
#' - Any files that have suffix "-MSc" will appear only in the
#'  `"msc"` handbook; see `courses` argument.
#'
#' The Rmd files in the "common/Rmd" directory are included in
#' handbook in increasing order of the number their filename begins
#' with. `"external"` is an exception to this rule, where the files
#' are included in the handbook in the order specified in
#' `external_common`.
#'
#' The files with filenames starting with "0000-" are ignored, as they
#' are intended to be hard-coded in the Rmd files of earlier sections
#' of the handbook.
#'
#' @author Ioannis Kosmidis (aut, cre) \email{ioannis.kosmidis@warwick.ac.uk}
#'
#' @export
compile_book <- function(working_dir,
                         courses = c("datascience", "morse", "mathstat", "msc", "external", "intercalated"),
                         include_source_names = FALSE,
                         quiet = TRUE,
                         compress = TRUE,
                         draft_version = TRUE,
                         external_common) {
    if (!all(courses %in% c("datascience", "morse", "mathstat", "msc", "external", "intercalated")))
        stop("`courses` should be at least one of 'datascience', 'morse', 'mathstat', 'msc', 'external', and 'intercalated'")
    working_dir <- path.expand(working_dir)
    ml_path <- file.path(working_dir, "module_lists.csv")
    module_lists <- try(read.csv(ml_path))
    if (inherits(module_lists, "try-error")) {
        stop(ml_path, " does not exist")
    }
    books_rmd <- file.path(working_dir, file.path(courses, "Rmd/"))
    ## config <- file.path(working_dir, "book-config/_bookdown.yml")
    book_config <- file.path(working_dir, "book-config/")
    drafts <- file.path(working_dir, paste0("drafts/", paste0(courses, "-handbook")))
    css_files <- dir(book_config, "*.css", full.names = TRUE)
    assets <- file.path(book_config, "assets")
    common_files <- dir(file.path(working_dir, "common/Rmd"), full.names = TRUE)

    for (j in seq_along(courses)) {
        book <- books_rmd[j]
        draft <- drafts[j]
        ## Generate common
        if (isTRUE(courses[j] == "external")) {
            if (missing(external_common)) {
                stop("`external_common` must be specified")
            }
            common_files <- file.path(file.path(working_dir, "common/Rmd"), external_common)
        }
        if (isTRUE(courses[j] == "intercalated")) {
            common_files <- NULL
        }
        else {
            if (courses[j] == "msc") {
                exclude <- grepl("-BSc|-EXTERNAL", common_files)
            }
            else {
                exclude <- grepl("-MSc|-EXTERNAL", common_files)
            }
            common_files <- common_files[!exclude]
            exclude <- grepl("0000-", common_files)
            common_files <- common_files[!exclude]
        }

        has_common <- isTRUE(length(common_files) > 0)
        common_paths <- file.path(book, "9999-common.Rmd")

        compile_it <- function(format) {
            file.copy(css_files, book)
            try(bookdown::render_book(book,
                                      output_format = format,
                                      ## config_file = config,
                                      output_dir = draft,
                                      quiet = quiet))
            file.remove(dir(book, "*.css", full.names = TRUE))
            if (has_common) {
                file.remove(common_paths)
            }
        }

        ## HTML
        if (has_common) {
            for (j in common_files) {
                if (isTRUE(include_source_names)) {
                    cat(note(x = j, type = "BEGIN", color = "red", output_format = "html"), file = common_paths, append = TRUE)
                }
                cat("```{r child ='", j, "'}\n```\n\n", sep = "", file = common_paths, append = TRUE)
                if (isTRUE(include_source_names)) {
                    cat(note(x = j, type = "END", color = "red", output_format = "html"), file = common_paths, append = TRUE)
                }
            }
        }

        compile_it("bookdown::gitbook")

        ## PDF
        if (has_common) {
            for (j in common_files) {
                if (isTRUE(include_source_names)) {
                    cat(note(x = j, type = "BEGIN", color = "red", output_format = "pdf"), file = common_paths, append = TRUE)
                }
                cat("```{r child ='", j, "'}\n```\n\n", sep = "", file = common_paths, append = TRUE)
                if (isTRUE(include_source_names)) {
                    cat(note(x = j, type = "END", color = "red", output_format = "pdf"), file = common_paths, append = TRUE)
                }
            }
        }

        compile_it("bookdown::pdf_book")

        ## DOCX
        if (has_common) {
            for (j in common_files) {
                if (isTRUE(include_source_names)) {
                    cat(note(x = j, type = "BEGIN", color = "red", output_format = "word"), file = common_paths, append = TRUE)
                }
                cat("```{r child ='", j, "'}\n```\n\n", sep = "", file = common_paths, append = TRUE)
                if (isTRUE(include_source_names)) {
                    cat(note(x = j, type = "END", color = "red", output_format = "word"), file = common_paths, append = TRUE)
                }
            }
        }

        compile_it("bookdown::word_document2")

        ## Copy assets
        if (dir.exists(assets)) {
            file.copy(assets, draft, recursive = TRUE)
        }
        ## Compress
        if (isTRUE(compress)) {
            zip::zip(paste0(draft, "-", format(Sys.time(), format = "%d-%b-%Y"), ".zip"), files = draft, mode = "cherry-pick")
        }

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
