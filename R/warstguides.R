#' Methods to maintain the Course Handbooks of the Department of
#' Statistics at University of Warwick
#'
#' Provides methods and functions to maintain and export the course
#' handbooks of the Department of Statistics at Unviersity of Warwick
#' using Rmarkdown files. The package depends on a particular
#' organization of the content, so it wil; most probably not me of any
#' use to anyone outside the Department of Statistics at Unviersity of
#' Warwick.
#'
#' @author Ioannis Kosmidis \email{ioannis.kosmidis@warwick.ac.uk}
#'
#' @docType package
#' @name warstguides
#' @importFrom rmarkdown render html_document word_document pdf_document pandoc_convert  md_document
#' @importFrom clipr write_clip
#' @importFrom knitr kable
#' @importFrom readr read_file
#' @importFrom utils read.csv
#' @importFrom stats setNames
#' @import dplyr
#'
NULL

utils::globalVariables(c("Course", "Year", "List", "BSc", "Mlevel", "Stream", "URL", "Notes",
                         "empty_url", "Name", "empty_notes", "Suspended", "Suspended_Session",
                         "ID"))
