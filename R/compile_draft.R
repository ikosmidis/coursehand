#' Compile a handbook draft
#'
#' @param working_dir the directory where the handbook structure is,
#'     i.e. with directories course/md course/html-* and common/md
#'     common/html-*, as created by the script
#'     download_convert_organize_handbook_files.R.
#' @param courses at least one of `"datascience"`, `"morse"`,
#'     `"mathstat"`, `"msc"` indicating which handbook drafts to
#'     compile. Default is `c("datascience", "morse", "mathstat")`.
#' @param include_source_names should the draft include notes of what
#'     md file each part of the draft corresponds to? Default is
#'     `TRUE`.
#' @param keep_source should the draft md files be kept or deleted
#'     after compilation? Default is `FALSE`.
#' @param output_format either `"html"` (default), `"word"`, or `"pdf"`.
#' @param quiet suppress printing of progress? Default is `TRUE`.
#'
#' @details
#'
#' Only useful for the pre-bookdown directory structure
#'
#' @author Ioannis Kosmidis (aut, cre) \email{ioannis.kosmidis@warwick.ac.uk}
#'
#' @export
compile_draft <- function(working_dir,
                          courses = c("datascience", "morse", "mathstat", "msc"),
                          include_source_names = TRUE,
                          keep_source = FALSE,
                          output_format = "html",
                          quiet = TRUE) {
    if (!all(courses %in% c("datascience", "morse", "mathstat", "msc")))
        stop("`courses` should be at least one of 'datascience', 'morse', and 'mathstat'")
    ## Try to get the module list
    ml_path <- file.path(working_dir, "module_lists.csv")
    module_lists <- try(read.csv(ml_path))
    if (inherits(module_lists, "try-error")) {
        stop(ml_path, " does not exist")
    }
    out_format <- switch(output_format,
                         "html" = rmarkdown::html_document(toc  = FALSE,
                                                           toc_depth = 3,
                                                           theme = NULL,
                                                           template = NULL,
                                                           pandoc_args = "--columns=10000",
                                                           self_contained = FALSE),
                         "word" = rmarkdown::word_document(),
                         "pdf" = rmarkdown::pdf_document(toc = FALSE,
                                                         template = NULL,
                                                         pandoc_args = "--columns=10000",
                                                         latex_engine = "xelatex"),
                         "unsupported format")
    courses_md_dir <- setNames(paste(working_dir, courses, "Rmd", sep = "/"), courses)
    courses_md_files <- setNames(lapply(courses, function(x) {
        paste0("../", x, "/Rmd/", dir(courses_md_dir[x], pattern = ".md"))
    }), courses)
    common_md_dir <- paste(working_dir, "common/Rmd/", sep = "/")
    common_md_files_all <- paste0("../common/Rmd/", dir(common_md_dir))
    drafts <- file.path(working_dir, "drafts")
    if (!dir.exists(drafts)) {
        dir.create(drafts)
    }

    ## IK, For MSc specific in common
    ## chars <- substr(msc_specific, 1, 4)
    ## grep(paste(chars, collapse = "|"), common_md_files)
    ## msc_common_inds <- grep(paste(msc_specific, collapse = "|"), common_md_files)

    msc_specific <- grepl("-MSc", common_md_files_all)
    bsc_specific <- grepl("-BSc", common_md_files_all)


    for (course in courses) {
        ## IK, For MSc specific in common
        if (course == "msc") {
            common_md_files <- common_md_files_all[!bsc_specific]
        }
        else {
            common_md_files <- common_md_files_all[!msc_specific]
        }
        ## yaml
        master_md <- file.path(drafts, paste0("draft_", course, ".Rmd"))
        cat("---\n", paste("title:", course, "handbook"), "\n---\n", sep = "", file = master_md, append = FALSE)
        for (f in courses_md_files[[course]]) {
            ## preventive hack just in case
            if (identical(f, basename(master_md))) next
            if (isTRUE(include_source_names)) {
                cat(note(x = f, type = "BEGIN", color = "red", output_format = output_format), file = master_md, append = TRUE)
            }
            cat("```{r child = '", f, "'}\n", sep = "", file = master_md, append = TRUE)
            cat("```\n\n", file = master_md, append = TRUE)
            if (isTRUE(include_source_names)) {
                cat(note(x = f, type = "END", color = "red", output_format = output_format), file = master_md, append = TRUE)
            }
        }
        for (f in common_md_files) {
            if (isTRUE(include_source_names)) {
                cat(note(x = f, type = "BEGIN", color = "red", output_format = output_format), file = master_md, append = TRUE)
            }
            cat("```{r child = '", f, "'}\n", sep = "", file = master_md, append = TRUE)
            cat("```\n\n", file = master_md, append = TRUE)
            if (isTRUE(include_source_names)) {
                cat(note(x = f, type = "END", color = "red", output_format = output_format), file = master_md, append = TRUE)
            }
        }
        rmarkdown::render(master_md, output_dir = drafts, output_format = out_format,
                          quiet = quiet)
        if (!isTRUE(keep_source)) file.remove(master_md)
    }
}
