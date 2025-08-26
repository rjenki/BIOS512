# BIOS512

I will be posting the lecture examples and detailed instructions on how to run them on your device. 

## Course Repositiories:
NEW: https://github.com/Vincent-Toups/bios512  
OLD: https://github.com/chuckpr/BIOS512

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/rjenki/BIOS512/HEAD)

### Binder Set Up
Using the instructions from https://book.the-turing-way.org/communication/binder/zero-to-binder.html, I set up Binder for this Git repository using the R instructions.  
*I did have to add options(repos = c(CRAN = "https://cran.r-project.org")) to the first line of my install.R file.

### Converting .Rmd files to .ipynb
*You may not need this! But, here it is if you do...*
Open the terminal on your computer and type in the following commands. 
*<DIR> means the directory that your Rmd file is saved in. <file> means the name of the .Rmd file.
```
python3 --version
brew install pipx
pipx ensurepath
source ~/.zshrc
pipx install notedown
pipx inject notedown setuptools
notedown ~/<DIR>/<file>.Rmd --knit > ~/<DIR>/<file>.ipynb
```
*Notes:* 
*<DIR> means the directory that your Rmd file is saved in. <file> means the name of the .Rmd file.
*Make sure that knitr is installed on your R Studio.

### Lecture 1 - Using ggplot with given data
#### Using Binder
Coming soon!  

#### Using Docker
Open Docker and go to the terminal and type in the following commands.
```
git clone -b main https://github.com/rjenki/BIOS512.git ~/BIOS512
cd ~/BIOS512/lecture1
docker build --platform=linux/amd64 -t bios512-lecture1 .
docker run --rm --platform=linux/amd64 -v $(pwd):/app bios512-lecture1
```
*Notes:*  
In the lecture, R studio is used to run the code. Here, we aren't using R Studio, so I replaced the last line in the plat-data-data.R file with a ggsave.  
I have a Mac with a Silicon processor (M1, M2, ...). **If you are using something with an Intel processor, then you can use the alternate commands below:**
```
git clone -b main https://github.com/rjenki/BIOS512.git ~/BIOS512
cd ~/BIOS512/lecture1
docker build -t bios512-lecture1 .
docker run --rm -v $(pwd):/app bios512-lecture1
```
Essentially, you do not need to specify platform if you have an Intel processor because that is Docker's default.  
After running, you should see **lecture1.png** in the lecture1 folder.  

#### Using R Studio
Before using R Studio, make sure you have your files (data-data.csv, plot-data-data.R) in a ~/BIOS512/lecture1 folder.  
Go into R Studio and make sure the following packages are installed: readr, ggplot2, tidyr. To install them, click on Tools > Install Packages on the menu at the top of the screen, then type "readr, ggplot2, tidyr".  
Then, open the terminal and type in:
```
Rscript plot-data-data.R
```
After running, you should see **lecture1.png** in the lecture1 folder.
