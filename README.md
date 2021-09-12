
<!-- README.md is generated from README.Rmd. Please edit that file -->

# coursehand

**coursehand** provides methods and functions to maintain and export the
course handbooks of the Department of Statistics at University of
Warwick using Rmarkdown files. The package depends on a particular
organization of the content, so it will, most probably, not be of any
immediate use to anyone outside the Department of Statistics at
University of Warwick.

## Developed and maintained by

[Ioannis Kosmidis](http://ikosmdis.com)

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ikosmidis/coursehand")
```

## Example

This is a basic example which shows you some of the methods in
**coursehand**.

``` r
library("coursehand")
```

### Listing handbook source files

First, we need to specify where the directory structure with the
handbook files is. For example, in my machine this is

``` r
working_dir <- "~/Repositories/warwick-stats-handbooks"
```

Then, we can list the available Rmd files for the various courses. For
example,

``` r
list_course_Rmd(working_dir, "datascience")
#>  [1] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0011-amendments.Rmd"          
#>  [2] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0020-about.Rmd"               
#>  [3] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0030-courses.Rmd"             
#>  [4] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0060-section2.Rmd"            
#>  [5] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0070-year1.Rmd"               
#>  [6] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0080-year1progression.Rmd"    
#>  [7] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0090-year2.Rmd"               
#>  [8] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0100-year2progression.Rmd"    
#>  [9] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0110-year3bsc.Rmd"            
#> [10] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0120-year3bscoutcomes.Rmd"    
#> [11] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0130-year3MSci.Rmd"           
#> [12] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0140-year3MSciprogression.Rmd"
#> [13] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0150-year4MSci.Rmd"           
#> [14] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0160-year4outcomes.Rmd"       
#> [15] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/drafts"                       
#> [16] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/index.Rmd"
list_course_Rmd(working_dir, "mathstat")
#>  [1] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0011-amendments.Rmd"               
#>  [2] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0020-about.Rmd"                    
#>  [3] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0030-courses.Rmd"                  
#>  [4] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0060-section2.Rmd"                 
#>  [5] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0070-year1.Rmd"                    
#>  [6] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0080-year1progression.Rmd"         
#>  [7] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0090-year2.Rmd"                    
#>  [8] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0100-year2progression.Rmd"         
#>  [9] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0110-year3bsc.Rmd"                 
#> [10] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0120-year3bscoutcomes.Rmd"         
#> [11] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0130-year3Mmathstat.Rmd"           
#> [12] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0140-year3Mmathstatprogression.Rmd"
#> [13] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0150-year4mmathstat.Rmd"           
#> [14] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0160-year4outcomes.Rmd"            
#> [15] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/drafts"                            
#> [16] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/index.Rmd"
list_course_Rmd(working_dir, "morse", full_path = FALSE)
#>  [1] "0011-amendments.Rmd"             "0020-about.Rmd"                 
#>  [3] "0030-courses.Rmd"                "0060-section2.Rmd"              
#>  [5] "0070-year1.Rmd"                  "0080-year1progression.Rmd"      
#>  [7] "0090-year2.Rmd"                  "0100-year2progression.Rmd"      
#>  [9] "0110-year3bsc.Rmd"               "0120-year3bscoutcomes.Rmd"      
#> [11] "0130-year3mmorse.Rmd"            "0140-year3mmorse-g30a.Rmd"      
#> [13] "0150-year3mmorse-g30b.Rmd"       "0160-year3mmorse-g30c.Rmd"      
#> [15] "0170-year3mmorse-g30d.Rmd"       "0180-year3mmorseprogression.Rmd"
#> [17] "0190-year4mmorse.Rmd"            "0200-year4mmorse-g30a.Rmd"      
#> [19] "0210-year4mmorse-g30b.Rmd"       "0220-year4mmorse-g30c.Rmd"      
#> [21] "0230-year4mmorse-g30d.Rmd"       "0240-year4outcomes.Rmd"         
#> [23] "drafts"                          "index.Rmd"
```

We can also list the files for the common part in each handbook

``` r
list_course_Rmd(working_dir, "common", full_path = FALSE)
#>  [1] "0000-facilities.Rmd"              "0000-people.Rmd"                 
#>  [3] "0010-section3.Rmd"                "0020-modulecodes.Rmd"            
#>  [5] "0030-modulechoice-BSc.Rmd"        "0030-modulechoice-MSc.Rmd"       
#>  [7] "0040-moduleregistration-BSc.Rmd"  "0040-moduleregistration-MSc.Rmd" 
#>  [9] "0050-unusualoptions-BSc.Rmd"      "0050-unusualoptions-MSc.Rmd"     
#> [11] "0060-coursetransfers-BSc.Rmd"     "0070-section4.Rmd"               
#> [13] "0080-lecturesandtutorials.Rmd"    "0090-feedback.Rmd"               
#> [15] "0100-attendance.Rmd"              "0120-studyskills.Rmd"            
#> [17] "0130-section5.Rmd"                "0140-examinations.Rmd"           
#> [19] "0150-coursework.Rmd"              "0160-cheating.Rmd"               
#> [21] "0170-adjustment.Rmd"              "0180-mitigation.Rmd"             
#> [23] "0181-selfcertification.Rmd"       "0190-resits-BSc.Rmd"             
#> [25] "0190-resits-MSc.Rmd"              "0200-examboards-BSc.Rmd"         
#> [27] "0200-examboards-MSc.Rmd"          "0210-classification-BSc.Rmd"     
#> [29] "0210-classification-MSc.Rmd"      "0220-marks.Rmd"                  
#> [31] "0221-transcripts-BSc.Rmd"         "0230-prizesandexemptions-BSc.Rmd"
#> [33] "0240-exitawards-BSc.Rmd"          "0250-appeals-BSc.Rmd"            
#> [35] "0250-appeals-MSc.Rmd"             "0260-section6.Rmd"               
#> [37] "0270-personaltutor-BSc.Rmd"       "0270-personaltutor-MSc.Rmd"      
#> [39] "0280-mscresources-MSc.Rmd"        "0290-departmentsupport.Rmd"      
#> [41] "0300-centralsupport.Rmd"          "0310-values.Rmd"                 
#> [43] "0320-section7.Rmd"                "0330-sslc.Rmd"                   
#> [45] "0340-modulefeedback.Rmd"          "0350-coursefeedback.Rmd"         
#> [47] "0360-complaints.Rmd"              "0370-section8.Rmd"               
#> [49] "0380-careers.Rmd"                 "0390-maximise.Rmd"               
#> [51] "0400-careersinteaching-BSc.Rmd"   "0410-reference.Rmd"              
#> [53] "0420-section9.Rmd"                "0430-policies-BSc.Rmd"           
#> [55] "0430-policies-MSc.Rmd"            "0440-supportforlearning.Rmd"     
#> [57] "0450-universitycontacts-BSc.Rmd"  "0450-universitycontacts-MSc.Rmd"
```

### Rendering specific source files in HTML

If the handbook pages sit in Sitebuilder, we can update the handbook
pages one-by-one by converting the corresponding file into html format,
copy that html content into the clipboard, and then paste into the
`html` window that Sitebuilder provides. The conversion and the copying
can be done using the `Rmd_to_html()` functions. For example, the
content for
`https://warwick.ac.uk/fac/sci/statistics/currentstudents/handbooks/morse/year4mmorse-g30b/`
can be updated by editing `0210-year4mmorse-g30b.Rmd` and doing

``` r
Rmd_to_html("0210-year4mmorse-g30b.Rmd",
            course = "morse",
            working_dir = working_dir)
#> contents of ~/Repositories/warwick-stats-handbooks/drafts/Rmd_to_html/0210-year4mmorse-g30b.html are in the clipboard!
```

### Compiling hanbdooks

We can compile the hanbdooks for the courses in HTML and PDF format
using [bookdown](https://bookdown.org). The output is in the `drafts/`
sub-directory under `working_directory`. For example, the following
command compiles the handbooks for the Data Science, MORSE and MathStat
courses of the Department of Statistics at University of Warwick.

``` r
compile_book(working_dir = working_dir,
             courses = c("datascience", "morse", "mathstat"),
             include_source_names = FALSE,
             draft_version = FALSE)
```

### Retrieving module lists

We can also retrieve the module lists appearing in the handbooks. For
example, the core modules in Data Science year 2 are

``` r
module_db <- file.path(working_dir, "module_lists.csv")
get_module_list(module_db, course = "datascience", year = 2, list = "Core", bsc = "Yes")
#> 
#> 
#> |Code  |Name                                                                             |CATS |Term |
#> |:-----|:--------------------------------------------------------------------------------|:----|:----|
#> |CS258 |[Database Systems](https://warwick.ac.uk/fac/sci/dcs/teaching/modules/cs258)     |15   |1    |
#> |CS260 |[Algorithms](https://go.warwick.ac.uk/cs260)                                     |15   |1    |
#> |CS261 |[Software Engineering](https://warwick.ac.uk/fac/sci/dcs/teaching/modules/cs261) |15   |2    |
#> |ST202 |[Stochastic Processes](http://go.warwick.ac.uk/ST202)                            |12   |2    |
#> |ST208 |[Mathematical Methods](http://go.warwick.ac.uk/ST208)                            |12   |1    |
#> |ST218 |[Mathematical Statistics Part A](http://go.warwick.ac.uk/ST218)                  |12   |1    |
#> |ST219 |[Mathematical Statistics Part B](http://go.warwick.ac.uk/ST219)                  |12   |2    |
```
