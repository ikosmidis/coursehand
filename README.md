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
in the 19/20 and 20/21 session have online versions created using the
Sitebuilder, the content management system that University of Warwick
uses. For example, the Data Science course handbook can be found
[here](https://warwick.ac.uk/fac/sci/statistics/currentstudents/handbooks/datascience).

We can update the handbook pages one-by-one by converting the
corresponding file into html format, copy that html content into the
clipboard, and then paste itto the `html` window that Sitebuilder
provides. The conversion and the copying can be done using the
`Rmd_to_html()` functions. For example, the content for
`https://warwick.ac.uk/fac/sci/statistics/currentstudents/handbooks/morse/year4mmorse-g30b/`
can be updated by editting `0210-year4mmorse-g30b.Rmd` and doing

    Rmd_to_html("0210-year4mmorse-g30b.Rmd",
                course = "morse",
                working_dir = working_dir)
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
