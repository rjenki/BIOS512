# BIOS512

This is my Git repository to use for assisting with BIOS 512. 

## Course Repositiories:
NEW: https://github.com/Vincent-Toups/bios512  
OLD: https://github.com/chuckpr/BIOS512

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/rjenki/BIOS512/HEAD)

### Binder Set Up
Using the instructions from https://book.the-turing-way.org/communication/binder/zero-to-binder.html, I set up Binder for this Git repository using the R instructions.  
*I did have to add options(repos = c(CRAN = "https://cran.r-project.org")) to the first line of my install.R file.

### Lecture 1 Example
#### Using Docker
Open Docker and go to the terminal and type in the following commands.
```
git clone -b main https://github.com/rjenki/BIOS512.git ~/BIOS512
cd ~/BIOS512/lecture1
docker build --platform=linux/amd64 -t bios512-lecture1 .
docker run --rm --platform=linux/amd64 -v $(pwd):/app bios512-lecture1
```
*Notes: In the lecture, R studio is used to run the code. Here, we aren't using R Studio, so I replaced the last line in the plat-data-data.R file with a ggsave.*  
After running, you should see lecture1.png in the lecture1 folder.

#### Using R Studio
Before using R Studio, make sure you have your files (data-data.csv, plot-data-data.R) in a ~/BIOS512/lecture1 folder.
Go into R Studio and make sure the following packages are installed: readr, ggplot2, tidyr.
Then, open the terminal and type in:
```
Rscript plot-data-data.R
```
After running, you should see lecture1.png in the lecture1 folder.
