#' List Rmd files available for a course
#'
#' @param course one of "datascience", "morse", "mathstat" or "common".
#' @param working_dir the path to the working directory.
#' @param full_path should the full paths to the md files be returned? Default is `TRUE`.
list_course_Rmd <- function(working_dir, course, full_path = TRUE) {
    dir(paste(working_dir, course, "Rmd", sep = "/"), full.names = full_path)
}

