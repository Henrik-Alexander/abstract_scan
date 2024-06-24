# Abstract Scan

This folder contains the code and the data to perform the abstract scan for the project "Formal demography of fertility: a collaborative review". The core of the folder is the file "screening.R", which contains all the code for loading and executing the scan.
 
## How to download R and RStudio
The app requires you to have R and RStudio installed. If you have not installed the software please go to [RStudio](https://posit.co/download/rstudio-desktop/) and download a) R and then b) RStudio. Follow the instructions on the webpage.

## Instructions

1. If you have installed the software, download as well as unzipped the folder, you can start with the application. You can open the session by clicking on *abstract_scan/abstract_scan.Rproj*. RStudio should open automatically now.

2. The App uses a two packages (data.table and tidyverse), which need to be installed first. For that, please uncommand the two lines at the top of the script: 
  `install.packages("data.table")`
  `install.packages("tidyverse")`
The installation may take a few minutes.

3. Now, the session should be all set up and you can start with the actual work. If you would like to change the font, the size or the color, please go to *Tools/Global options/Appearance* and change the respective appearance.

4. To start the scanning, please click the Button *source* in the top right corner of RStudio or press *STRG + Shift + S*

5. The program leads you through the different steps. First, you will be asked whether you are Annette, than you can specify your commands for "yes", "no", "maybe". There are two reserved commands: "exit" and "repeat". "Repeat" will ask you the previous question again. "Exit" will end the session and the script runs till the end until it prints "Screening complete!"


# Session info
R version 4.3.0 (2023-04-21 ucrt)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 19045)

Matrix products: default


## locale:
- LC_COLLATE=English_United States.utf8 
- LC_CTYPE=English_United States.utf8  
- LC_MONETARY=English_United States.utf8
- LC_NUMERIC=C               
- LC_TIME=English_United States.utf8    

### time zone: Europe/Berlin
tzcode source: internal

### attached base packages:
- stats  
- graphics 
- grDevices utils  
- datasets 
- methods 
- base     

### other attached packages:
- lubridate_1.9.3 
- forcats_1.0.0   
- stringr_1.5.1  
- dplyr_1.1.3    
- purrr_1.0.1    
- readr_2.1.4  
- tidyr_1.3.0      
- tibble_3.2.1   
- ggplot2_3.4.4   
- tidyverse_2.0.0  
- data.table_1.14.8

### loaded via a namespace (and not attached):
- gtable_0.3.4   
- compiler_4.3.0  
- tidyselect_1.2.0  
- scales_1.2.1    
- fastmap_1.1.1   
- R6_2.5.1      
- generics_0.1.3   
- knitr_1.43   
- munsell_0.5.0  
- pillar_1.9.0     
- tzdb_0.4.0     
- rlang_1.1.1    
- utf8_1.2.4     
- stringi_1.7.12   
- xfun_0.39     
- timechange_0.2.0 
- cli_3.6.1     
- withr_2.5.2   
- magrittr_2.0.3  
- digest_0.6.33  
- grid_4.3.0       
- rstudioapi_0.15.0
- hms_1.1.3    
- lifecycle_1.0.4  
- vctrs_0.6.3      
- evaluate_0.23    
- glue_1.6.2     
- sessioninfo_1.2.2
- fansi_1.0.5  
- colorspace_2.1-0 
- rmarkdown_2.25 
- tools_4.3.0  
- pkgconfig_2.0.3 
- htmltools_0.5.7 
