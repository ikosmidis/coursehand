<!-- README.md is generated from README.Rmd. Please edit that file -->

warstguides
===========

**warstguides** provides methods and functions to maintain and export
the course handbooks of the Department of Statistics at Unviersity of
Warwick using Rmarkdown files. The package depends on a particular
organization of the content, so it will, most probably, not be of any
immediate use to anyone outside the Department of Statistics at
Unviersity of Warwick.

Installation
------------

You can install the development version from
[GitHub](https://github.com/) with:

    # install.packages("devtools")
    devtools::install_github("ikosmidis/warstguides")

Example
-------

This is a basic example which shows you some of the methods in
**warstguides**.

    library("warstguides")

First, we need to specify whetre the directory structure with the
handbook files is. For example, in my machine this is

    working_dir <- "~/Repositories/warwick-stats-handbooks"

Then, we can list the available Rmd files for the various courses. For
example,

    list_course_Rmd(working_dir, "datascience")
    #>  [1] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0010-section1.Rmd"            
    #>  [2] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0020-about.Rmd"               
    #>  [3] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0030-courses.Rmd"             
    #>  [4] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0040-people.Rmd"              
    #>  [5] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0050-facilities.Rmd"          
    #>  [6] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0060-section2.Rmd"            
    #>  [7] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0070-year1.Rmd"               
    #>  [8] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0080-year1progression.Rmd"    
    #>  [9] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0090-year2.Rmd"               
    #> [10] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0100-year2progression.Rmd"    
    #> [11] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0110-year3bsc.Rmd"            
    #> [12] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0120-year3bscoutcomes.Rmd"    
    #> [13] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0130-year3MSci.Rmd"           
    #> [14] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0140-year3MSciprogression.Rmd"
    #> [15] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0150-year4MSci.Rmd"           
    #> [16] "/Users/yiannis/Repositories/warwick-stats-handbooks/datascience/Rmd/0160-year4outcomes.Rmd"
    list_course_Rmd(working_dir, "mathstat")
    #>  [1] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0010-section1.Rmd"                 
    #>  [2] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0020-about.Rmd"                    
    #>  [3] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0030-courses.Rmd"                  
    #>  [4] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0040-people.Rmd"                   
    #>  [5] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0050-facilities.Rmd"               
    #>  [6] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0060-section2.Rmd"                 
    #>  [7] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0070-year1.Rmd"                    
    #>  [8] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0080-year1progression.Rmd"         
    #>  [9] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0090-year2.Rmd"                    
    #> [10] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0100-year2progression.Rmd"         
    #> [11] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0110-year3bsc.Rmd"                 
    #> [12] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0120-year3bscoutcomes.Rmd"         
    #> [13] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0130-year3Mmathstat.Rmd"           
    #> [14] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0140-year3Mmathstatprogression.Rmd"
    #> [15] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0150-year4mmathstat.Rmd"           
    #> [16] "/Users/yiannis/Repositories/warwick-stats-handbooks/mathstat/Rmd/0160-year4outcomes.Rmd"
    list_course_Rmd(working_dir, "morse", full_path = FALSE)
    #>  [1] "0010-section1.Rmd"               "0020-about.Rmd"                 
    #>  [3] "0030-courses.Rmd"                "0040-people.Rmd"                
    #>  [5] "0050-facilities.Rmd"             "0060-section2.Rmd"              
    #>  [7] "0070-year1.Rmd"                  "0080-year1progression.Rmd"      
    #>  [9] "0090-year2.Rmd"                  "0100-year2progression.Rmd"      
    #> [11] "0110-year3bsc.Rmd"               "0120-year3bscoutcomes.Rmd"      
    #> [13] "0130-year3mmorse.Rmd"            "0140-year3mmorse-g30a.Rmd"      
    #> [15] "0150-year3mmorse-g30b.Rmd"       "0160-year3mmorse-g30c.Rmd"      
    #> [17] "0170-year3mmorse-g30d.Rmd"       "0180-year3mmorseprogression.Rmd"
    #> [19] "0190-year4mmorse.Rmd"            "0200-year4mmorse-g30a.Rmd"      
    #> [21] "0210-year4mmorse-g30b.Rmd"       "0220-year4mmorse-g30c.Rmd"      
    #> [23] "0230-year4mmorse-g30d.Rmd"       "0240-year4outcomes.Rmd"

We can also list the files for the common part in each handbook

    list_course_Rmd(working_dir, "common", full_path = FALSE)
    #>  [1] "0010-section3.Rmd"             "0020-modulecodes.Rmd"         
    #>  [3] "0030-modulechoice.Rmd"         "0040-moduleregistration.Rmd"  
    #>  [5] "0050-unusualoptions.Rmd"       "0060-coursetransfers.Rmd"     
    #>  [7] "0070-section4.Rmd"             "0080-lecturesandtutorials.Rmd"
    #>  [9] "0090-feedback.Rmd"             "0100-attendance.Rmd"          
    #> [11] "0110-monitoring.Rmd"           "0120-studyskills.Rmd"         
    #> [13] "0130-section5.Rmd"             "0140-examinations.Rmd"        
    #> [15] "0150-coursework.Rmd"           "0160-cheating.Rmd"            
    #> [17] "0170-adjustment.Rmd"           "0180-mitigation.Rmd"          
    #> [19] "0190-resits.Rmd"               "0200-examboards.Rmd"          
    #> [21] "0210-classification.Rmd"       "0220-marks.Rmd"               
    #> [23] "0230-prizesandexemptions.Rmd"  "0240-exitawards.Rmd"          
    #> [25] "0250-appeals.Rmd"              "0260-section6.Rmd"            
    #> [27] "0270-personaltutor.Rmd"        "0280-mentors.Rmd"             
    #> [29] "0290-departmentsupport.Rmd"    "0300-centralsupport.Rmd"      
    #> [31] "0310-values.Rmd"               "0320-section7.Rmd"            
    #> [33] "0330-sslc.Rmd"                 "0340-modulefeedback.Rmd"      
    #> [35] "0350-coursefeedback.Rmd"       "0360-complaints.Rmd"          
    #> [37] "0370-section8.Rmd"             "0380-careers.Rmd"             
    #> [39] "0390-maximise.Rmd"             "0400-careersinteaching.Rmd"   
    #> [41] "0410-reference.Rmd"            "0420-section9.Rmd"            
    #> [43] "0430-policies.Rmd"             "0440-supportforlearning.Rmd"  
    #> [45] "0450-universitycontacts.Rmd"

The handbooks of the Department of Statistics at University of Warwick
in the 19/20 and 20/21 session have online versions. For example, the
Data Science course handbook can be found
[here](https://warwick.ac.uk/fac/sci/statistics/currentstudents/handbooks/datascience).
We can update those pages one-by-one by coverting the corresponding file
into html format, copy that html content into the clipboard and then
paste it to Warwick’s content management system. All this can be done
using the `Rmd_to_html()` functions. For example the content for
`https://warwick.ac.uk/fac/sci/statistics/currentstudents/handbooks/morse/year4mmorse-g30b/`
can be updated by editting `0210-year4mmorse-g30b.Rmd` and doing

    Rmd_to_html("0210-year4mmorse-g30b.Rmd",
                course = "morse",
                working_dir = working_dir)
    #> 
    #> 
    #> processing file: 0210-year4mmorse-g30b.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> output file: 0210-year4mmorse-g30b.knit.md
    #> /usr/local/bin/pandoc +RTS -K512m -RTS 0210-year4mmorse-g30b.utf8.md --to markdown_strict --from markdown+autolink_bare_uris+tex_math_single_backslash --output /Users/yiannis/Repositories/warwick-stats-handbooks/drafts/Rmd_to_md/0210-year4mmorse-g30b.md --standalone --columns=10000
    #> 
    #> Output created: ~/Repositories/warwick-stats-handbooks/drafts/Rmd_to_md/0210-year4mmorse-g30b.md
    #> contents of ~/Repositories/warwick-stats-handbooks/drafts/Rmd_to_html/0210-year4mmorse-g30b.html are in the clipboard!

Finally, we can compile drafts of the full handbook for the courses. The
output is in the `drafts/` sub-directory under `working_directory`. For
example, the folloing command compiles the handbooks for the Data
Science, MORSE and MathStat courses of the Department of Statistics at
University of Warwick into html format. The output is specifically
marked to indicate from which Rmd file each part of the content comes
from.

    compile_draft(working_dir = working_dir,
                  courses = c("datascience", "morse", "mathstat"),
                  include_source_names = TRUE,
                  keep_source = FALSE,
                  output_format = "html")
    #> 
    #> 
    #> processing file: draft_datascience.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |.                                                                     |   1%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.                                                                     |   2%
    #> label: unnamed-chunk-1 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0010-section1.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-1' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0010-section1.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..                                                                    |   2%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..                                                                    |   3%
    #> label: unnamed-chunk-2 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0020-about.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-2' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0020-about.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...                                                                   |   4%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...                                                                   |   5%
    #> label: unnamed-chunk-3 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0030-courses.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-3' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0030-courses.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....                                                                  |   6%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.....                                                                 |   7%
    #> label: unnamed-chunk-4 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0040-people.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-4' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0040-people.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |......                                                                |   8%
    #> label: unnamed-chunk-5 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0050-facilities.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-5' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0050-facilities.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |......                                                                |   9%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.......                                                               |  10%
    #> label: unnamed-chunk-6 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0060-section2.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-6' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0060-section2.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.......                                                               |  11%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........                                                              |  11%
    #> label: unnamed-chunk-7 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0070-year1.Rmd"
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0070-year1.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |.......................                                               |  33%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...............................................                       |  67%
    #> label: unnamed-chunk-62 (with options) 
    #> List of 3
    #>  $ eval   : logi TRUE
    #>  $ echo   : logi FALSE
    #>  $ results: chr "asis"
    #> 
    #>   |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.........                                                             |  12%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.........                                                             |  13%
    #> label: unnamed-chunk-8 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0080-year1progression.Rmd"
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0080-year1progression.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..........                                                            |  14%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..........                                                            |  15%
    #> label: unnamed-chunk-9 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0090-year2.Rmd"
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0090-year2.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |..............                                                        |  20%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |............................                                          |  40%
    #> label: unnamed-chunk-63 (with options) 
    #> List of 3
    #>  $ eval   : logi TRUE
    #>  $ echo   : logi FALSE
    #>  $ results: chr "asis"
    #> 
    #>   |                                                                              |..........................................                            |  60%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........................................................              |  80%
    #> label: unnamed-chunk-64 (with options) 
    #> List of 3
    #>  $ eval   : logi TRUE
    #>  $ echo   : logi FALSE
    #>  $ results: chr "asis"
    #> 
    #>   |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...........                                                           |  15%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...........                                                           |  16%
    #> label: unnamed-chunk-10 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0100-year2progression.Rmd"
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0100-year2progression.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |............                                                          |  17%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.............                                                         |  18%
    #> label: unnamed-chunk-11 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0110-year3bsc.Rmd"
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0110-year3bsc.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |..........                                                            |  14%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................                                                  |  29%
    #> label: unnamed-chunk-65 (with options) 
    #> List of 3
    #>  $ eval   : logi TRUE
    #>  $ echo   : logi FALSE
    #>  $ results: chr "asis"
    #> 
    #>   |                                                                              |..............................                                        |  43%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........................................                              |  57%
    #> label: unnamed-chunk-66 (with options) 
    #> List of 3
    #>  $ eval   : logi TRUE
    #>  $ echo   : logi FALSE
    #>  $ results: chr "asis"
    #> 
    #>   |                                                                              |..................................................                    |  71%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |............................................................          |  86%
    #> label: unnamed-chunk-67 (with options) 
    #> List of 3
    #>  $ eval   : logi TRUE
    #>  $ echo   : logi FALSE
    #>  $ results: chr "asis"
    #> 
    #>   |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.............                                                         |  19%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..............                                                        |  20%
    #> label: unnamed-chunk-12 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0120-year3bscoutcomes.Rmd"
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0120-year3bscoutcomes.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...............                                                       |  21%
    #> label: unnamed-chunk-13 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0130-year3MSci.Rmd"
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0130-year3MSci.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |..........                                                            |  14%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................                                                  |  29%
    #> label: unnamed-chunk-68 (with options) 
    #> List of 3
    #>  $ eval   : logi TRUE
    #>  $ echo   : logi FALSE
    #>  $ results: chr "asis"
    #> 
    #>   |                                                                              |..............................                                        |  43%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........................................                              |  57%
    #> label: unnamed-chunk-69 (with options) 
    #> List of 3
    #>  $ eval   : logi TRUE
    #>  $ echo   : logi FALSE
    #>  $ results: chr "asis"
    #> 
    #>   |                                                                              |..................................................                    |  71%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |............................................................          |  86%
    #> label: unnamed-chunk-70 (with options) 
    #> List of 3
    #>  $ eval   : logi TRUE
    #>  $ echo   : logi FALSE
    #>  $ results: chr "asis"
    #> 
    #>   |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...............                                                       |  22%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |................                                                      |  23%
    #> label: unnamed-chunk-14 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0140-year3MSciprogression.Rmd"
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0140-year3MSciprogression.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.................                                                     |  24%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-15 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0150-year4MSci.Rmd"
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0150-year4MSci.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |..........                                                            |  14%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................                                                  |  29%
    #> label: unnamed-chunk-71 (with options) 
    #> List of 3
    #>  $ eval   : logi TRUE
    #>  $ echo   : logi FALSE
    #>  $ results: chr "asis"
    #> 
    #>   |                                                                              |..............................                                        |  43%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........................................                              |  57%
    #> label: unnamed-chunk-72 (with options) 
    #> List of 3
    #>  $ eval   : logi TRUE
    #>  $ echo   : logi FALSE
    #>  $ results: chr "asis"
    #> 
    #>   |                                                                              |..................................................                    |  71%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |............................................................          |  86%
    #> label: unnamed-chunk-73 (with options) 
    #> List of 3
    #>  $ eval   : logi TRUE
    #>  $ echo   : logi FALSE
    #>  $ results: chr "asis"
    #> 
    #>   |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..................                                                    |  25%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..................                                                    |  26%
    #> label: unnamed-chunk-16 (with options) 
    #> List of 1
    #>  $ child: chr "../datascience/Rmd/0160-year4outcomes.Rmd"
    #> 
    #> 
    #> processing file: ./../datascience/Rmd/0160-year4outcomes.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...................                                                   |  27%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...................                                                   |  28%
    #> label: unnamed-chunk-17 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0010-section3.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0010-section3.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....................                                                  |  28%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................                                                  |  29%
    #> label: unnamed-chunk-18 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0020-modulecodes.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0020-modulecodes.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.....................                                                 |  30%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |......................                                                |  31%
    #> label: unnamed-chunk-19 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0030-modulechoice.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0030-modulechoice.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |......................                                                |  32%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.......................                                               |  33%
    #> label: unnamed-chunk-20 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0040-moduleregistration.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0040-moduleregistration.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........................                                              |  34%
    #> label: unnamed-chunk-21 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0050-unusualoptions.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0050-unusualoptions.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |........................                                              |  35%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.........................                                             |  36%
    #> label: unnamed-chunk-22 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0060-coursetransfers.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0060-coursetransfers.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..........................                                            |  37%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-23 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0070-section4.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0070-section4.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...........................                                           |  38%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...........................                                           |  39%
    #> label: unnamed-chunk-24 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0080-lecturesandtutorials.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0080-lecturesandtutorials.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |............................                                          |  40%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |............................                                          |  41%
    #> label: unnamed-chunk-25 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0090-feedback.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0090-feedback.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.............................                                         |  41%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..............................                                        |  42%
    #> label: unnamed-chunk-26 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0100-attendance.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0100-attendance.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..............................                                        |  43%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...............................                                       |  44%
    #> label: unnamed-chunk-27 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0110-monitoring.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0110-monitoring.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...............................                                       |  45%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |................................                                      |  46%
    #> label: unnamed-chunk-28 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0120-studyskills.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0120-studyskills.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.................................                                     |  47%
    #> label: unnamed-chunk-29 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0130-section5.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0130-section5.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..................................                                    |  48%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..................................                                    |  49%
    #> label: unnamed-chunk-30 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0140-examinations.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0140-examinations.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...................................                                   |  50%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-31 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0150-coursework.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0150-coursework.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....................................                                  |  51%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................................                                  |  52%
    #> label: unnamed-chunk-32 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0160-cheating.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0160-cheating.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.....................................                                 |  53%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |......................................                                |  54%
    #> label: unnamed-chunk-33 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0170-adjustment.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0170-adjustment.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.......................................                               |  55%
    #> label: unnamed-chunk-34 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0180-mitigation.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0180-mitigation.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.......................................                               |  56%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........................................                              |  57%
    #> label: unnamed-chunk-35 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0190-resits.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0190-resits.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |........................................                              |  58%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.........................................                             |  59%
    #> label: unnamed-chunk-36 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0200-examboards.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0200-examboards.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..........................................                            |  59%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..........................................                            |  60%
    #> label: unnamed-chunk-37 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0210-classification.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0210-classification.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...........................................                           |  61%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...........................................                           |  62%
    #> label: unnamed-chunk-38 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0220-marks.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0220-marks.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |............................................                          |  63%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-39 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0230-prizesandexemptions.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0230-prizesandexemptions.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.............................................                         |  64%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..............................................                        |  65%
    #> label: unnamed-chunk-40 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0240-exitawards.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0240-exitawards.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..............................................                        |  66%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...............................................                       |  67%
    #> label: unnamed-chunk-41 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0250-appeals.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0250-appeals.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |................................................                      |  68%
    #> label: unnamed-chunk-42 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0260-section6.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0260-section6.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |................................................                      |  69%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.................................................                     |  70%
    #> label: unnamed-chunk-43 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0270-personaltutor.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0270-personaltutor.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..................................................                    |  71%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..................................................                    |  72%
    #> label: unnamed-chunk-44 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0280-mentors.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0280-mentors.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...................................................                   |  72%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...................................................                   |  73%
    #> label: unnamed-chunk-45 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0290-departmentsupport.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0290-departmentsupport.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....................................................                  |  74%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................................................                  |  75%
    #> label: unnamed-chunk-46 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0300-centralsupport.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0300-centralsupport.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.....................................................                 |  76%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-47 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0310-values.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0310-values.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |......................................................                |  77%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.......................................................               |  78%
    #> label: unnamed-chunk-48 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0320-section7.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0320-section7.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.......................................................               |  79%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........................................................              |  80%
    #> label: unnamed-chunk-49 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0330-sslc.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0330-sslc.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.........................................................             |  81%
    #> label: unnamed-chunk-50 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0340-modulefeedback.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0340-modulefeedback.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.........................................................             |  82%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..........................................................            |  83%
    #> label: unnamed-chunk-51 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0350-coursefeedback.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0350-coursefeedback.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...........................................................           |  84%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...........................................................           |  85%
    #> label: unnamed-chunk-52 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0360-complaints.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0360-complaints.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |............................................................          |  85%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |............................................................          |  86%
    #> label: unnamed-chunk-53 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0370-section8.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0370-section8.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.............................................................         |  87%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.............................................................         |  88%
    #> label: unnamed-chunk-54 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0380-careers.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0380-careers.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..............................................................        |  89%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...............................................................       |  89%
    #> label: unnamed-chunk-55 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0390-maximise.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0390-maximise.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...............................................................       |  90%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |................................................................      |  91%
    #> label: unnamed-chunk-56 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0400-careersinteaching.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0400-careersinteaching.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |................................................................      |  92%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.................................................................     |  93%
    #> label: unnamed-chunk-57 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0410-reference.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0410-reference.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..................................................................    |  94%
    #> label: unnamed-chunk-58 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0420-section9.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0420-section9.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...................................................................   |  95%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...................................................................   |  96%
    #> label: unnamed-chunk-59 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0430-policies.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0430-policies.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....................................................................  |  97%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................................................................  |  98%
    #> label: unnamed-chunk-60 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0440-supportforlearning.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0440-supportforlearning.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..................................................................... |  98%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..................................................................... |  99%
    #> label: unnamed-chunk-61 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0450-universitycontacts.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0450-universitycontacts.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> output file: draft_datascience.knit.md
    #> /usr/local/bin/pandoc +RTS -K512m -RTS draft_datascience.utf8.md --to html4 --from markdown+autolink_bare_uris+tex_math_single_backslash --output /Users/yiannis/Repositories/warwick-stats-handbooks/drafts/draft_datascience.html --email-obfuscation none --columns=10000 --standalone --section-divs --highlight-style pygments --include-in-header /var/folders/3t/00tlvfn14zq5v45q3q3y63cm0000gn/T//Rtmp2nUFAy/rmarkdown-straae779bf78f8.html --mathjax --lua-filter /Library/Frameworks/R.framework/Versions/4.0/Resources/library/rmarkdown/rmd/lua/pagebreak.lua --lua-filter /Library/Frameworks/R.framework/Versions/4.0/Resources/library/rmarkdown/rmd/lua/latex-div.lua
    #> 
    #> Output created: /Users/yiannis/Repositories/warwick-stats-handbooks/drafts/draft_datascience.html
    #> 
    #> 
    #> processing file: draft_morse.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |.                                                                     |   1%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-1 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0010-section1.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-1' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0010-section1.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..                                                                    |   2%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..                                                                    |   3%
    #> label: unnamed-chunk-2 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0020-about.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-2' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0020-about.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...                                                                   |   4%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-3 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0030-courses.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-3' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0030-courses.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....                                                                  |   5%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....                                                                  |   6%
    #> label: unnamed-chunk-4 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0040-people.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-4' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0040-people.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.....                                                                 |   6%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.....                                                                 |   7%
    #> label: unnamed-chunk-5 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0050-facilities.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-5' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0050-facilities.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |......                                                                |   8%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |......                                                                |   9%
    #> label: unnamed-chunk-6 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0060-section2.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-6' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0060-section2.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.......                                                               |   9%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.......                                                               |  10%
    #> label: unnamed-chunk-7 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0070-year1.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0070-year1.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |........                                                              |  11%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........                                                              |  12%
    #> label: unnamed-chunk-8 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0080-year1progression.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0080-year1progression.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.........                                                             |  12%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.........                                                             |  13%
    #> label: unnamed-chunk-9 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0090-year2.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0090-year2.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..........                                                            |  14%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-10 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0100-year2progression.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0100-year2progression.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...........                                                           |  15%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...........                                                           |  16%
    #> label: unnamed-chunk-11 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0110-year3bsc.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0110-year3bsc.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |............                                                          |  17%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-12 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0120-year3bscoutcomes.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0120-year3bscoutcomes.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.............                                                         |  18%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.............                                                         |  19%
    #> label: unnamed-chunk-13 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0130-year3mmorse.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0130-year3mmorse.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..............                                                        |  19%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..............                                                        |  20%
    #> label: unnamed-chunk-14 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0140-year3mmorse-g30a.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0140-year3mmorse-g30a.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...............                                                       |  21%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...............                                                       |  22%
    #> label: unnamed-chunk-15 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0150-year3mmorse-g30b.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0150-year3mmorse-g30b.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |................                                                      |  22%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |................                                                      |  23%
    #> label: unnamed-chunk-16 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0160-year3mmorse-g30c.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0160-year3mmorse-g30c.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.................                                                     |  24%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-17 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0170-year3mmorse-g30d.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0170-year3mmorse-g30d.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..................                                                    |  25%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..................                                                    |  26%
    #> label: unnamed-chunk-18 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0180-year3mmorseprogression.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0180-year3mmorseprogression.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...................                                                   |  27%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-19 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0190-year4mmorse.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0190-year4mmorse.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....................                                                  |  28%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................                                                  |  29%
    #> label: unnamed-chunk-20 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0200-year4mmorse-g30a.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0200-year4mmorse-g30a.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.....................                                                 |  29%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.....................                                                 |  30%
    #> label: unnamed-chunk-21 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0210-year4mmorse-g30b.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0210-year4mmorse-g30b.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |......................                                                |  31%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |......................                                                |  32%
    #> label: unnamed-chunk-22 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0220-year4mmorse-g30c.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0220-year4mmorse-g30c.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.......................                                               |  32%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.......................                                               |  33%
    #> label: unnamed-chunk-23 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0230-year4mmorse-g30d.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0230-year4mmorse-g30d.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |........................                                              |  34%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........................                                              |  35%
    #> label: unnamed-chunk-24 (with options) 
    #> List of 1
    #>  $ child: chr "../morse/Rmd/0240-year4outcomes.Rmd"
    #> 
    #> 
    #> processing file: ./../morse/Rmd/0240-year4outcomes.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.........................                                             |  35%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.........................                                             |  36%
    #> label: unnamed-chunk-25 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0010-section3.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0010-section3.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..........................                                            |  37%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-26 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0020-modulecodes.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0020-modulecodes.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...........................                                           |  38%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...........................                                           |  39%
    #> label: unnamed-chunk-27 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0030-modulechoice.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0030-modulechoice.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |............................                                          |  40%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-28 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0040-moduleregistration.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0040-moduleregistration.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.............................                                         |  41%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.............................                                         |  42%
    #> label: unnamed-chunk-29 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0050-unusualoptions.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0050-unusualoptions.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..............................                                        |  42%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..............................                                        |  43%
    #> label: unnamed-chunk-30 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0060-coursetransfers.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0060-coursetransfers.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...............................                                       |  44%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...............................                                       |  45%
    #> label: unnamed-chunk-31 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0070-section4.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0070-section4.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |................................                                      |  45%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |................................                                      |  46%
    #> label: unnamed-chunk-32 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0080-lecturesandtutorials.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0080-lecturesandtutorials.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.................................                                     |  47%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-33 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0090-feedback.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0090-feedback.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..................................                                    |  48%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..................................                                    |  49%
    #> label: unnamed-chunk-34 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0100-attendance.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0100-attendance.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...................................                                   |  50%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-35 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0110-monitoring.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0110-monitoring.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....................................                                  |  51%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................................                                  |  52%
    #> label: unnamed-chunk-36 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0120-studyskills.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0120-studyskills.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.....................................                                 |  53%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-37 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0130-section5.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0130-section5.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |......................................                                |  54%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |......................................                                |  55%
    #> label: unnamed-chunk-38 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0140-examinations.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0140-examinations.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.......................................                               |  55%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.......................................                               |  56%
    #> label: unnamed-chunk-39 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0150-coursework.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0150-coursework.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |........................................                              |  57%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........................................                              |  58%
    #> label: unnamed-chunk-40 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0160-cheating.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0160-cheating.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.........................................                             |  58%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.........................................                             |  59%
    #> label: unnamed-chunk-41 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0170-adjustment.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0170-adjustment.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..........................................                            |  60%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-42 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0180-mitigation.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0180-mitigation.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...........................................                           |  61%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...........................................                           |  62%
    #> label: unnamed-chunk-43 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0190-resits.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0190-resits.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |............................................                          |  63%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-44 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0200-examboards.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0200-examboards.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.............................................                         |  64%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.............................................                         |  65%
    #> label: unnamed-chunk-45 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0210-classification.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0210-classification.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..............................................                        |  65%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..............................................                        |  66%
    #> label: unnamed-chunk-46 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0220-marks.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0220-marks.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...............................................                       |  67%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...............................................                       |  68%
    #> label: unnamed-chunk-47 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0230-prizesandexemptions.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0230-prizesandexemptions.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |................................................                      |  68%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |................................................                      |  69%
    #> label: unnamed-chunk-48 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0240-exitawards.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0240-exitawards.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.................................................                     |  70%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.................................................                     |  71%
    #> label: unnamed-chunk-49 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0250-appeals.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0250-appeals.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..................................................                    |  71%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..................................................                    |  72%
    #> label: unnamed-chunk-50 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0260-section6.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0260-section6.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...................................................                   |  73%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-51 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0270-personaltutor.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0270-personaltutor.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....................................................                  |  74%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................................................                  |  75%
    #> label: unnamed-chunk-52 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0280-mentors.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0280-mentors.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.....................................................                 |  76%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-53 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0290-departmentsupport.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0290-departmentsupport.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |......................................................                |  77%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |......................................................                |  78%
    #> label: unnamed-chunk-54 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0300-centralsupport.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0300-centralsupport.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.......................................................               |  78%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.......................................................               |  79%
    #> label: unnamed-chunk-55 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0310-values.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0310-values.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |........................................................              |  80%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........................................................              |  81%
    #> label: unnamed-chunk-56 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0320-section7.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0320-section7.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.........................................................             |  81%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.........................................................             |  82%
    #> label: unnamed-chunk-57 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0330-sslc.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0330-sslc.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..........................................................            |  83%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-58 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0340-modulefeedback.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0340-modulefeedback.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...........................................................           |  84%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...........................................................           |  85%
    #> label: unnamed-chunk-59 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0350-coursefeedback.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0350-coursefeedback.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |............................................................          |  86%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-60 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0360-complaints.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0360-complaints.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.............................................................         |  87%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.............................................................         |  88%
    #> label: unnamed-chunk-61 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0370-section8.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0370-section8.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..............................................................        |  88%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..............................................................        |  89%
    #> label: unnamed-chunk-62 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0380-careers.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0380-careers.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...............................................................       |  90%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...............................................................       |  91%
    #> label: unnamed-chunk-63 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0390-maximise.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0390-maximise.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |................................................................      |  91%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |................................................................      |  92%
    #> label: unnamed-chunk-64 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0400-careersinteaching.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0400-careersinteaching.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.................................................................     |  93%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.................................................................     |  94%
    #> label: unnamed-chunk-65 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0410-reference.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0410-reference.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..................................................................    |  94%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..................................................................    |  95%
    #> label: unnamed-chunk-66 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0420-section9.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0420-section9.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...................................................................   |  96%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-67 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0430-policies.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0430-policies.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....................................................................  |  97%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................................................................  |  98%
    #> label: unnamed-chunk-68 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0440-supportforlearning.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0440-supportforlearning.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..................................................................... |  99%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-69 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0450-universitycontacts.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0450-universitycontacts.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> output file: draft_morse.knit.md
    #> /usr/local/bin/pandoc +RTS -K512m -RTS draft_morse.utf8.md --to html4 --from markdown+autolink_bare_uris+tex_math_single_backslash --output /Users/yiannis/Repositories/warwick-stats-handbooks/drafts/draft_morse.html --email-obfuscation none --columns=10000 --standalone --section-divs --highlight-style pygments --include-in-header /var/folders/3t/00tlvfn14zq5v45q3q3y63cm0000gn/T//Rtmp2nUFAy/rmarkdown-straae799f203a.html --mathjax --lua-filter /Library/Frameworks/R.framework/Versions/4.0/Resources/library/rmarkdown/rmd/lua/pagebreak.lua --lua-filter /Library/Frameworks/R.framework/Versions/4.0/Resources/library/rmarkdown/rmd/lua/latex-div.lua
    #> 
    #> Output created: /Users/yiannis/Repositories/warwick-stats-handbooks/drafts/draft_morse.html
    #> 
    #> 
    #> processing file: draft_mathstat.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |.                                                                     |   1%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.                                                                     |   2%
    #> label: unnamed-chunk-1 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0010-section1.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-1' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0010-section1.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..                                                                    |   2%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..                                                                    |   3%
    #> label: unnamed-chunk-2 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0020-about.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-2' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0020-about.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...                                                                   |   4%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...                                                                   |   5%
    #> label: unnamed-chunk-3 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0030-courses.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-3' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0030-courses.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....                                                                  |   6%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.....                                                                 |   7%
    #> label: unnamed-chunk-4 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0040-people.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-4' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0040-people.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |......                                                                |   8%
    #> label: unnamed-chunk-5 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0050-facilities.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-5' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0050-facilities.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |......                                                                |   9%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.......                                                               |  10%
    #> label: unnamed-chunk-6 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0060-section2.Rmd"
    #> Warning in call_block(x): The chunk 'unnamed-chunk-6' has the 'child' option,
    #> and this code chunk must be empty. Its code will be ignored.
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0060-section2.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.......                                                               |  11%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........                                                              |  11%
    #> label: unnamed-chunk-7 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0070-year1.Rmd"
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0070-year1.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.........                                                             |  12%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.........                                                             |  13%
    #> label: unnamed-chunk-8 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0080-year1progression.Rmd"
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0080-year1progression.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..........                                                            |  14%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..........                                                            |  15%
    #> label: unnamed-chunk-9 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0090-year2.Rmd"
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0090-year2.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...........                                                           |  15%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...........                                                           |  16%
    #> label: unnamed-chunk-10 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0100-year2progression.Rmd"
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0100-year2progression.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |............                                                          |  17%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.............                                                         |  18%
    #> label: unnamed-chunk-11 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0110-year3bsc.Rmd"
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0110-year3bsc.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.............                                                         |  19%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..............                                                        |  20%
    #> label: unnamed-chunk-12 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0120-year3bscoutcomes.Rmd"
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0120-year3bscoutcomes.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...............                                                       |  21%
    #> label: unnamed-chunk-13 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0130-year3Mmathstat.Rmd"
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0130-year3Mmathstat.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...............                                                       |  22%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |................                                                      |  23%
    #> label: unnamed-chunk-14 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0140-year3Mmathstatprogression.Rmd"
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0140-year3Mmathstatprogression.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.................                                                     |  24%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-15 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0150-year4mmathstat.Rmd"
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0150-year4mmathstat.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..................                                                    |  25%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..................                                                    |  26%
    #> label: unnamed-chunk-16 (with options) 
    #> List of 1
    #>  $ child: chr "../mathstat/Rmd/0160-year4outcomes.Rmd"
    #> 
    #> 
    #> processing file: ./../mathstat/Rmd/0160-year4outcomes.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...................                                                   |  27%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...................                                                   |  28%
    #> label: unnamed-chunk-17 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0010-section3.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0010-section3.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....................                                                  |  28%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................                                                  |  29%
    #> label: unnamed-chunk-18 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0020-modulecodes.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0020-modulecodes.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.....................                                                 |  30%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |......................                                                |  31%
    #> label: unnamed-chunk-19 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0030-modulechoice.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0030-modulechoice.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |......................                                                |  32%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.......................                                               |  33%
    #> label: unnamed-chunk-20 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0040-moduleregistration.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0040-moduleregistration.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........................                                              |  34%
    #> label: unnamed-chunk-21 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0050-unusualoptions.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0050-unusualoptions.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |........................                                              |  35%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.........................                                             |  36%
    #> label: unnamed-chunk-22 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0060-coursetransfers.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0060-coursetransfers.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..........................                                            |  37%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-23 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0070-section4.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0070-section4.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...........................                                           |  38%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...........................                                           |  39%
    #> label: unnamed-chunk-24 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0080-lecturesandtutorials.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0080-lecturesandtutorials.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |............................                                          |  40%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |............................                                          |  41%
    #> label: unnamed-chunk-25 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0090-feedback.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0090-feedback.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.............................                                         |  41%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..............................                                        |  42%
    #> label: unnamed-chunk-26 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0100-attendance.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0100-attendance.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..............................                                        |  43%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...............................                                       |  44%
    #> label: unnamed-chunk-27 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0110-monitoring.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0110-monitoring.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...............................                                       |  45%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |................................                                      |  46%
    #> label: unnamed-chunk-28 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0120-studyskills.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0120-studyskills.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.................................                                     |  47%
    #> label: unnamed-chunk-29 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0130-section5.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0130-section5.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..................................                                    |  48%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..................................                                    |  49%
    #> label: unnamed-chunk-30 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0140-examinations.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0140-examinations.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...................................                                   |  50%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-31 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0150-coursework.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0150-coursework.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....................................                                  |  51%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................................                                  |  52%
    #> label: unnamed-chunk-32 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0160-cheating.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0160-cheating.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.....................................                                 |  53%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |......................................                                |  54%
    #> label: unnamed-chunk-33 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0170-adjustment.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0170-adjustment.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.......................................                               |  55%
    #> label: unnamed-chunk-34 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0180-mitigation.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0180-mitigation.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.......................................                               |  56%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........................................                              |  57%
    #> label: unnamed-chunk-35 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0190-resits.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0190-resits.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |........................................                              |  58%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.........................................                             |  59%
    #> label: unnamed-chunk-36 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0200-examboards.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0200-examboards.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..........................................                            |  59%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..........................................                            |  60%
    #> label: unnamed-chunk-37 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0210-classification.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0210-classification.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...........................................                           |  61%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...........................................                           |  62%
    #> label: unnamed-chunk-38 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0220-marks.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0220-marks.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |............................................                          |  63%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-39 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0230-prizesandexemptions.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0230-prizesandexemptions.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.............................................                         |  64%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..............................................                        |  65%
    #> label: unnamed-chunk-40 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0240-exitawards.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0240-exitawards.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..............................................                        |  66%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...............................................                       |  67%
    #> label: unnamed-chunk-41 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0250-appeals.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0250-appeals.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |................................................                      |  68%
    #> label: unnamed-chunk-42 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0260-section6.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0260-section6.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |................................................                      |  69%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.................................................                     |  70%
    #> label: unnamed-chunk-43 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0270-personaltutor.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0270-personaltutor.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..................................................                    |  71%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..................................................                    |  72%
    #> label: unnamed-chunk-44 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0280-mentors.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0280-mentors.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...................................................                   |  72%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...................................................                   |  73%
    #> label: unnamed-chunk-45 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0290-departmentsupport.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0290-departmentsupport.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....................................................                  |  74%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................................................                  |  75%
    #> label: unnamed-chunk-46 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0300-centralsupport.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0300-centralsupport.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.....................................................                 |  76%
    #>   ordinary text without R code
    #> 
    #> 
    #> label: unnamed-chunk-47 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0310-values.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0310-values.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |......................................................                |  77%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.......................................................               |  78%
    #> label: unnamed-chunk-48 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0320-section7.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0320-section7.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.......................................................               |  79%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |........................................................              |  80%
    #> label: unnamed-chunk-49 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0330-sslc.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0330-sslc.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.........................................................             |  81%
    #> label: unnamed-chunk-50 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0340-modulefeedback.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0340-modulefeedback.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.........................................................             |  82%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..........................................................            |  83%
    #> label: unnamed-chunk-51 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0350-coursefeedback.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0350-coursefeedback.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...........................................................           |  84%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...........................................................           |  85%
    #> label: unnamed-chunk-52 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0360-complaints.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0360-complaints.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |............................................................          |  85%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |............................................................          |  86%
    #> label: unnamed-chunk-53 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0370-section8.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0370-section8.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |.............................................................         |  87%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.............................................................         |  88%
    #> label: unnamed-chunk-54 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0380-careers.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0380-careers.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..............................................................        |  89%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...............................................................       |  89%
    #> label: unnamed-chunk-55 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0390-maximise.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0390-maximise.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...............................................................       |  90%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |................................................................      |  91%
    #> label: unnamed-chunk-56 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0400-careersinteaching.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0400-careersinteaching.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |................................................................      |  92%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |.................................................................     |  93%
    #> label: unnamed-chunk-57 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0410-reference.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0410-reference.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #> 
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..................................................................    |  94%
    #> label: unnamed-chunk-58 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0420-section9.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0420-section9.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |...................................................................   |  95%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |...................................................................   |  96%
    #> label: unnamed-chunk-59 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0430-policies.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0430-policies.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |....................................................................  |  97%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |....................................................................  |  98%
    #> label: unnamed-chunk-60 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0440-supportforlearning.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0440-supportforlearning.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |..................................................................... |  98%
    #>   ordinary text without R code
    #> 
    #>   |                                                                              |..................................................................... |  99%
    #> label: unnamed-chunk-61 (with options) 
    #> List of 1
    #>  $ child: chr "../common/Rmd/0450-universitycontacts.Rmd"
    #> 
    #> 
    #> processing file: ./../common/Rmd/0450-universitycontacts.Rmd
    #>   |                                                                              |                                                                      |   0%  |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> 
    #> 
    #>   |                                                                              |......................................................................| 100%
    #>   ordinary text without R code
    #> output file: draft_mathstat.knit.md
    #> /usr/local/bin/pandoc +RTS -K512m -RTS draft_mathstat.utf8.md --to html4 --from markdown+autolink_bare_uris+tex_math_single_backslash --output /Users/yiannis/Repositories/warwick-stats-handbooks/drafts/draft_mathstat.html --email-obfuscation none --columns=10000 --standalone --section-divs --highlight-style pygments --include-in-header /var/folders/3t/00tlvfn14zq5v45q3q3y63cm0000gn/T//Rtmp2nUFAy/rmarkdown-straae72dfcc4c5.html --mathjax --lua-filter /Library/Frameworks/R.framework/Versions/4.0/Resources/library/rmarkdown/rmd/lua/pagebreak.lua --lua-filter /Library/Frameworks/R.framework/Versions/4.0/Resources/library/rmarkdown/rmd/lua/latex-div.lua
    #> 
    #> Output created: /Users/yiannis/Repositories/warwick-stats-handbooks/drafts/draft_mathstat.html
