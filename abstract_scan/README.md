# Abstract Scan

This folder contains the code and the data to perform the abstract scan. The heart of the folder is the file "screening.R", which contains all the code for loading an d executing the scan.

## How to download R and RStudio

The app requires you to have R and RStudio installe. If you have not installed the software please go to [RStudio](https://posit.co/download/rstudio-desktop/) and download 1. R and then 2. RStudio. Follow the instructions on the webpage.

## Instructions

1. If you have installed the software and download as well as unzipped the folder, you can start with the application. You can open the session by clicking on *abstract_scan/abstract_scan.Rproj*. RStudio should open automatically now.
2. The App uses a few packages, which need to be installed first. For that, please uncommand the two lines at the top of the script: install.packages("data.table"), install.packages("tidyverse"). The installation may take two minutes.
3. Now, the session should be all set up and you can start with the actual work. If you would like to change the font, the size or the color, please go to *Tools/Global options/Appearance* and change the respective appearance.
4. To start the scanning, please click the Button *source* in the top right corner of RStudio or press *STRG + Shift + S*
5. The program leads you through the different steps. First, you will be asked wether you are Annette, than you can specify your commands for "yes", "no", "maybe". There are two reserved commands: "exit" and "repeat". "Repeat" will ask you the previous question again. "Exit" will end the session and the script runs till the end until it prints "Screening complete!"