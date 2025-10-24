# BIOS512

I will be posting the lecture examples and detailed instructions on how to run them on your device. The first lecture includes multiple ways to run the code. The lectures after will include how to run on Binder for simplicity.

## Course Repositiories:
NEW: https://github.com/Vincent-Toups/bios512  
OLD: https://github.com/chuckpr/BIOS512  
BOOK: https://gitlab.com/vincent-toups/labradore

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/rjenki/BIOS512/HEAD)

## Binder Set Up
Using the instructions, ***with the changes below***, from https://book.the-turing-way.org/communication/binder/zero-to-binder.html, I set up Binder for this Git repository using the R instructions.  
*Notes:*  
To have the most up to date version of R, please use the following for your **runtime.txt** file.
```
r-4.3-2023-06-15
```
My **install.R** file included more packages, which we will need for the course. See below.
```
install.packages("tidyverse", dependencies = TRUE)
install.packages("rmarkdown", dependencies = TRUE)
install.packages("IRkernel", dependencies = TRUE)

IRkernel::installspec(user = FALSE)
```
Additionally, to export PDFs with LaTex and due to the `tidyverse` dependencies, I had to make a **apt.txt** file with the following:
```
libxml2-dev
libcurl4-openssl-dev
libssl-dev
libicu-dev
pandoc
texlive-xetex
texlive-fonts-recommended
texlive-plain-generic
```
### Adding packages to install.R later...
To add a package and incorporate that into your Binder, you will need to update your **install.R** file on GitHub and rerun it in Binder. For example, to add the *shiny* package, you will need to change your **install.R** file to what is shown below:
```
install.packages("tidyverse", dependencies = TRUE)
install.packages("rmarkdown", dependencies = TRUE)
install.packages("IRkernel", dependencies = TRUE)
install.packages("shiny"), dependencies = TRUE)

IRkernel::installspec(user = FALSE)
```
Then, you will need to open Binder and go to the terminal and type the following.
```
Rscript install.R
```
If I add a package in order to run example code, I will specify that in the notes.  

### HELP! I made a file in Binder... How do I save it to my repo?
**It is easier and preferred for you to create files on your local computer and then upload them to your git repo.** However, if you went into Binder and *then* created and edited your Jupyter Notebook, **IT WILL NOT AUTO SAVE.** Please either *download the assignment* and upload it to your git repo through the terminal on your computer, or *use the terminal on Binder* to make sure it saves (more steps).  
**Using Terminal**
1. On Binder, right click your file on the directory view (panel on left side of the screen) and click Download. 
2. On your computer, drag and drop or copy/paste your file into your git repo folder.
3. Type the following commands:
```
cd ~/<YOUR REPO>
git add <filename>
git commit -m "Added <filename>"
git push -u origin main
```
**On Binder**
1. First, you'll need to create a personal access token for Binder.
    1. Log into GitHub and go to Settings > Developer Settings > Personal access tokens (classic).
    2. Click Generate new token > Generate new token (classic).
    3. Give it a name and an expiration date.
    4. On scopes, check repo.
    5. Click Generate token at the bottom.
    6. Copy the token that appears and **SAVE IT SOMEWHERE**. It will only show you this token ONCE.
2. After creating your file in Binder, open a new tab and click Terminal.
3. Type the following commands:
```
git remote set-url origin https://<YOUR_TOKEN>@github.com/rjenki/BIOS512.git
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git add <filename>
git commit -m "Added <filename>"
git push -u origin main
```
4. Then, on the Terminal of your computer (not Binder), you'll need to pull your repo to get the new file on your local computer.
```
git pull origin main
```
*If you're making files on Binder, you'll need to **do steps 2-4 each time you open Binder** and make a new file or make changes to an old file in Binder.*
## Using Git Bash From The Terminal/Command Line
### Windows
Windows does not natively come with Linux installed, and Git runs on Linux.
1. Download **Git** for Windows: https://gitforwindows.org/. You'll need the Git-2.51.0-64-bit.exe file.
2. Install and open **Git Bash** (the application to run these commands on).
3. Once installed, configure your identity. For the email on this, it needs to be the same email as your GitHub account.
```
git config --global user.name "Your Name"
git config --global user.email "you@email.com"
```
4. Generate an SSH key. If using `ed25519` doesn't work, replace everything that says `ed25519` to `rsa`.
```
ssh-keygen -t ed25519 -C "you@email.com"
```
5. Set a passphrase for the SSH key. (It will prompt you to do this.)
6. Start the ssh-agent.
```
eval "$(ssh-agent -s)"
```
7. Add your key to the agent.
```
ssh-add ~/.ssh/id_ed25519
```
8. Copy the public key.
```
cat ~/.ssh/id_ed25519.pub
```
9. Then, on your browser, go to GitHub > Settings > SSH and GPG keys > New SSH key and paste the key.
10. Test it! In your terminal, type:
```
ssh -T git@github.com
```
The first time you do this, it'll ask if you want to continue connecting. Type `yes`, then it'll have you put in the passcode you set earlier. If it worked, you'll see a message that says you successfully authenticated. 
### Mac
Apple Macs run on Unix, which is extremely similar to Linux and allows users to run most Linux commands. You may need to install Git, however.
1. In your Terminal, type in `git --version`. If it returns a version, you're good to go!
2. If Git is not installed, you will get the option to install it. 
3. Once installed, configure your identity. For the email on this, it needs to be the same email as your GitHub account.
```
git config --global user.name "Your Name"
git config --global user.email "you@email.com"
```
4. Generate an SSH key.
```
ssh-keygen -t ed25519 -C "you@email.com"
```
It'll ask you to put the file save location. Click ENTER to use the default location.
5. Set a passphrase for the SSH key. (It will prompt you to do this.)
6. Start the ssh-agent.
```
eval "$(ssh-agent -s)"
```
7. Add your key to the agent.
```
ssh-add ~/.ssh/id_ed25519
```
8. Copy the public key.
```
cat ~/.ssh/id_ed25519.pub
```
9. Then, on your browser, go to GitHub > Settings > SSH and GPG keys > New SSH key and paste the key.
10. Test it! In your terminal, type:
```
ssh -T git@github.com
```
The first time you do this, it'll ask if you want to continue connecting. Type `yes`, then it'll have you put in the passcode you set earlier. If it worked, you'll see a message that says you successfully authenticated.  

## Lectures 14-16 - Classification and Regression  
If you want to run it, the derived data folder is blank and files will automatically be moved there. I am adding these lectures in the same folder since this was a three part lecture.    
    **Notes**:   
    *I added the following packages to my `install.R` file: `glmnet`, `broom`, `ggrepel`, `palmerpenguins`, `caret`, and `gbm`. 

## Lecture 13 - Clustering Workshop
Here's how to run it:
1. Click on my Binder button at the top of the page.
2. When Binder opens, navigate to the `lecture13` folder, and click on `clustering_workshop.ipynb`.
3. The Jupyter Notebook will open, and then you'll be able to run the chunks of code. You can edit this code within Binder. It doesn't affect mine.
    **Notes**:  
    *Don't forget that you have to run the previous code chunk before running the next one - each chunk builds on eachother!  
    *This code uses `plotly`, which I did not previously have installed. Because I updated my install.R file with the package, you will not have issues running it on my Binder link. However, if you are trying to replicate it on your repo, you will need to do this!  

## Lecture 12 - Clustering II
Interactive code is in the `lecture12` folder called `clustering_k_means_ii.ipynb`. This also includes everything from lecture 11, so you don't need two sets of notes!  
Here's how to run it:
1. Click on my Binder button at the top of the page.
2. When Binder opens, navigate to the `lecture12` folder, and click on `clustering_k_means_ii.ipynb`.
3. The Jupyter Notebook will open, and then you'll be able to run the chunks of code. You can edit this code within Binder. It doesn't affect mine.  
    **Notes**:  
    *Don't forget that you have to run the previous code chunk before running the next one - each chunk builds on eachother!  
    *This code uses `ppclust`, `mclust`, `rdist`, and `kernlab`, which I did not previously have installed. Because I updated my `install.R` file with the package, you will not have issues running it on my Binder.  
 

## Lecture 11 - Clustering I
Here's how to run it:
1. Click on my Binder button at the top of the page.
2. When Binder opens, navigate to the `lecture11` folder, and click on `clustering_k_means.ipynb`.
3. The Jupyter Notebook will open, and then you'll be able to run the chunks of code.   
    **Notes**:  
    *Don't forget that you have to run the previous code chunk before running the next one - each chunk builds on eachother!  
    *This code uses `matlab` and `GGally`, and `gridExtra`, which I did not previously have installed. Because I updated my `install.R` file with the package, you will not have issues running it on my Binder link. However, if you are trying to replicate it on your repo, you will need to do this!

## Lecture 10 - Advanced Git II
Detailed summary notes in the `lecture10` folder called `advanced_git_ii.md`. This also includes everything from lecture 9, so you don't need two sets of notes!  

## Lecture 9 - Advanced Git I
This lecture doesn't have any example code for you to run on your device, but I have detailed summary notes in the `lecture9` folder called `advanced_git_i.md`. Please check those out!  

## Lecture 8 - TNG Workshop (Effective Visualization II)
Here's how to run it:
1. Click on my Binder button at the top of the page.
2. When Binder opens, navigate to the `lecture8` folder, and click on `visuals_tng.ipynb`.
3. The Jupyter Notebook will open, and then you'll be able to run the chunks of code.  
    **Notes**:   
    *Don't forget that you have to run the previous code chunk before running the next one - each chunk builds on eachother!   
  
## Lecture 7 - Dimensionality Reduction
Here's how to run it:
1. Click on my Binder button at the top of the page.
2. When Binder opens, navigate to the `lecture7` folder, and click on `dimensionality_reduction.ipynb`.
3. The Jupyter Notebook will open, and then you'll be able to run the chunks of code.  
    **Notes**:   
    *Don't forget that you have to run the previous code chunk before running the next one - each chunk builds on eachother!  
    *This code uses `deSolve` and `Rtsne`, which I did not previously have installed. Because I updated my `install.R` file with the package, you will not have issues running it on my Binder link. However, if you are trying to replicate it on your repo, you will need to do this!
   
## Lecture 6 - NUFORC Workshop (Effective Visualization I)
Here's how to run it:
1. Click on my Binder button at the top of the page.
2. When Binder opens, navigate to the `lecture6` folder, and click on `nuforc_workshop.ipynb`.
3. The Jupyter Notebook will open, and then you'll be able to run the chunks of code.  
**Notes**:  
*Don't forget that you have to run the previous code chunk before running the next one - each chunk builds on eachother!
*This code uses `skimr`, which I did not previously have installed. Because I updated my `install.R` file with the package, you will not have issues running it on my Binder link. However, if you are trying to replicate it on your repo, you will need to do this!

## Lecture 5 - Tabular Data
Here's how to run the lecture code:  
1. Click on my Binder button at the top of the page.
2. When Binder opens, navigate to the `lecture5` folder, and click on `tabular_data.ipynb`.
3. The Jupyter Notebook will open, and then you'll be able to run the chunks of code.  
**Note**: Don't forget that you have to run the previous code chunk before running the next one - each chunk builds on eachother!

## Lecture 4 - Intro to Tidyverse
Here's how to run the example code.
1. Update your install.R file to include rmarkdown and tidyverse if it didn't have it already. (You can copy mine!)
2. Click on the Binder link on my repo and let it load. 
3. Open R Studio.
4. Navigate to the lecture4 folder, and click on the tidyverse_examples.Rmd file.  
5. You can either run the chunks individually, or click Run -> Run all chunks below.

## Lecture 3 - Intro to Git
Uploaded a summary notes file with key words, important commands, and how to set up your git repository. *Follow those instructions to set yours up!*

## Lecture 2 - Intro to R
Not posting examples from here because it was intro to R, however, you can launch the Rmd file in your Binder and run the code chunks to see the output.

## Lecture 1 - Using ggplot with given data
### Using Binder
See the section above and make sure you have the correct **install.R** file!  
```
cd ~/lecture1
Rscript plot-data-data.R
```
After running, on the side panel, you can navigate to the lecture1 folder and you should see **lecture1.png** in the lecture1 folder.  

### Using Docker
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

### Using R Studio
Before using R Studio, make sure you have your files (data-data.csv, plot-data-data.R) in a ~/BIOS512/lecture1 folder.  
Go into R Studio and make sure the following packages are installed: readr, ggplot2, tidyr. To install them, click on Tools > Install Packages on the menu at the top of the screen, then type "readr, ggplot2, tidyr".  


Then, open the terminal and type in:
```
Rscript plot-data-data.R
```
After running, you should see **lecture1.png** in the lecture1 folder.
