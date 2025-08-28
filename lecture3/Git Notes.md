## What is Git?
Git maintains a history of your codebase as a chain of "commits." The point of Git is to track the history of a software project and allow multiple people to work on the software project at the same time. Users have copies of the repository, and a suite of tools which constitute the version control system would make sure that changes that were submitted back to the official version of the code were correct.   
Git as a tool rewards the user most when they use it at the deepest level. For that reason, we'll be using it from the command line on our terminal.  

## Key words
**git:** a tool that allows to keep the history of a software project  
**GitHub:** a website that allows you to host git repositories  
**fork/branch:** refers to a user's personal copy of a Git repository  
**user story:** short description of what the user wants to go with git  
**git clone:** point to an existing repo and make a clone or copy of that repo at in a new directory, at another location (like a local folder on your computer)  
**git init:** creates a new git repo  
**git status:** list which files are staged, unstaged, and untracked  
**main:** most important branch
**git commit:** saves file changes to the main branch
**git add:** used to add changes from the working directory to the staging area
**git log:**

## Important Commands
### git Clone
```
git clone git@github.com:<user>/<repo>.git
```
Then, in your home directory on your computer, you'll see a <repo> folder with all your code to the last commit.  
For example, to clone my repo, you'd have:
```
git clone git@github.com:rjenki/BIOS512.git
```
### git init
```
cd /tmp/
rm -rf example
mkdir example
cd example
git init --initial-branch main
```
### git status
To use git status, make sure your current directory is the repo.
```
git status
```
### git add & git commit
How to make a new file in your terminal:
```
cat <<EOF > <filename>
# Title

This is an example.

EOF
```
*Notes:*  
cat prints things. <<EOF says to take everything typed until EOF appears and > <filename> to put it in this file. **Make sure your current directory is the one that contains your repo.**  
  
This is how to add it to your repo.
```
git add <file name>
git config --global user.email "your@email.com"
git config --global user.name "Your Name"
# we only have to do the above once.
git commit -m "Your commit message here."
```
Then, use git status to double check that this worked.
```
git status
```

**MORE COMING SOON...**






