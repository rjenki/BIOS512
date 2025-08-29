# BIOS512

I will be posting the lecture examples and detailed instructions on how to run them on your device. The first lecture includes multiple ways to run the code. The lectures after will include how to run on Binder for simplicity.

## Course Repositiories:
NEW: https://github.com/Vincent-Toups/bios512  
OLD: https://github.com/chuckpr/BIOS512

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/rjenki/BIOS512/HEAD)

### Binder Set Up
Using the instructions from https://book.the-turing-way.org/communication/binder/zero-to-binder.html, I set up Binder for this Git repository using the R instructions.  
*Notes:*  
My **install.R** file included more packages, which we will need for the course. See below.
```
options(repos = c(CRAN = "https://cran.r-project.org"))
install.packages(c("readr","ggplot2","tidyr"))
```
#### Important Note
To add a package and incorporate that into your Binder, you will need to update your **install.R** file on GitHub and rerun it in Binder. For example, to add the *shiny* package, you will need to change your **install.R** file to what is shown below:
```
options(repos = c(CRAN = "https://cran.r-project.org"))
install.packages(c("readr","ggplot2","tidyr","shiny"))
```
Then, you will need to open Binder and go to the terminal and type the following.
```
Rscript install.R
```
If I add a package in order to run example code, I will specify that in the notes.  

### Converting .Rmd files to .ipynb
*You may not need this! But, here it is if you do...*  
Open the terminal on your computer and type in the following commands.  
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
**DIR** means the directory that your Rmd file is saved in. **file** means the name of the .Rmd file.  
Make sure that *knitr* is installed on your R Studio.

### Lecture 1 - Using ggplot with given data
#### Using Binder
See the section above and make sure you have the correct **install.R** file!  
```
cd ~/lecture1
Rscript plot-data-data.R
```
After running, on the side panel, you can navigate to the lecture1 folder and you should see **lecture1.png** in the lecture1 folder.  

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

### Lecture 2 - Intro to R
Not posting examples from here because it was intro to R, however, you can launch the Rmd file in your Binder and run the code chunks to see the output.

### Lecture 3 - Intro to Git
Uploaded a summary notes file with key words, important commands, and how to set up your git repository. *Follow those instructions to set yours up!*

### Lecture 4 - Intro to Tidyverse
Here's how to run the example code.
1. Click on the Binder link on my repo and let it load. 
2. Open R Studio.
3. Install the tidyverse and rmarkdown packages.
4. Navigate to the lecture4 folder, and click on the tidyverse_examples.Rmd file.  
5. You can either run the chunks individually, or click Run -> Run all chunks below.
