#' Methods to maintain the Course Handbooks of the Department of
#' Statistics at University of Warwick
#'
#' Provides methods and functions to maintain and export the course
#' handbooks of the Department of Statistics at University of Warwick
#' using Rmarkdown files. The package depends on a particular
#' organization of the content, so it will, most probably, not be of
#' any immediate use to anyone outside the Department of Statistics at
#' University of Warwick.
#'
#' @author Ioannis Kosmidis \email{ioannis.kosmidis@warwick.ac.uk}
#'
#' @docType package
#' @name coursehand
#' @importFrom rmarkdown render html_document word_document pdf_document pandoc_convert  md_document
#' @import bookdown
#' @import wordcloud
#' @importFrom clipr write_clip
#' @importFrom knitr kable
#' @importFrom readr read_file
#' @importFrom utils read.csv
#' @importFrom stats setNames xtabs
#' @importFrom curl curl_fetch_memory
#' @importFrom rvest read_html html_attr html_nodes
#' @import dplyr
#' @import zip
#'
#' @author Ioannis Kosmidis (aut, cre) \email{ioannis.kosmidis@warwick.ac.uk}
#'
"_PACKAGE"

utils::globalVariables(c("Course", "Year", "List", "BSc", "Mlevel", "Stream", "URL", "Notes",
                         "empty_url", "Name", "empty_notes", "Suspended", "Suspended_Session",
                         "ID"))
