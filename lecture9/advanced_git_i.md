# Lecture 9: Advanced Git 1

These notes are based off the transcript of the lecture!

## What is Git?

Git is not only a version control system for the Linux kernel. It is a toolkit for manipulating the history of your project, looking backwards and forwards, connecting different pieces of changes from one place to another. If you use the tool correctly, your Git repository itself will become the most important piece of documentation. It's also amazing for collaboration on a coding project.

## Where do we use Git?

If you have a Mac or Linux operating system, you can use Git from your command line/terminal. If you have a Windows computer, use Git for Windows. All the commands we talk about assume you're using the command line.

## Holy Trinity of Git

1.  **Branch**: history of your code up until a certain moment (also called the **head** or the **history**). You can more specifically say that it is the history of patch files either going back to the beginning of the repo or the time that the branch diverged.\
    For example, below `exp1` branch diverges from main (after the third commit) and has its own commits \*-\*-\*-\*. `exp2` branch diverges from main even earlier and has its commits \*-\*-\*.

```         
main *-*-*-*-*-*-*
        \   \
exp1     \   *-*-*-* 
          \
exp2       *-*-*
```

2.  **Working copy**: the code you're actually editing (also called the **working tree** or the **tree**)
3.  **Staging area**: place where we construct commits

To put this into context, when you edit a file, the change shows up in your **working copy**. When you use `git add`, the change moves to the **staging area**. When you use `git commit`, everything in the **staging area** gets packaged into a new commit object. When you run `git push`, the commit is added to the **branch**.

## Git Vocabulary

1.  **subcommand**: A specific action within a larger command. For Git, `git` is the main command and `add`, `commit`, and `push` are all subcommands. Generally, you could think of it as `main_command subcommand [options/arguments]`.
2.  **commit**: A commit is a snapshot of your repository at a particular time (kind of - conceptually). The real definition is that a commit is a diff. It compares the previous state of the repository to the next state of the repository.
3.  **branch**: As mentioned above, this is the history of your code, or alternatively, a linear series of **commits**. A branch just points to a **commit**.
4.  **fork**: a copy of a repository that is permanently separate from the original (different from a branch, as a branch is temporary and part of the same repository)

## Creating a Git Repo

```         
rm -rf <repo>
mkdir <repo>
cd <repo>
git init
git branch -m main

# Use `cp` to copy files or `cp -r` to copy directories and their contents if needed

git status
```

## Committing Changes To Our New Git Repo

```         
cd <repo>
git add <file>

git config user.email "youremail@email.com"
git config user.name "Your Name"    

git commit -m "Your commit message here"
```

## Looking At Changes

```         
git status # Detailed section below
git diff # Gives us exact differences
```

## Git Commands

### Git Status

`On branch main`: Firstly, `git status` tells you what **branch** you're on.

`Your branch is up to date with 'origin/main'.`: It also tells you whether your **branch** is ahead/behind the remote (what's published to GitHub).

`Changes not staged for commit`: These are edits you’ve made to files but that are not staged. These are part of your **working copy**.

`Untracked files`: It also shows new, untracked files. These are part of your **working copy**.

`Changes to be committed`:\
This shows what's in the staging \*\*area\*, where changes go after you run `git add`. They'll be included in your next commit.

### Git Add

Adds changes to the **staging area**.

### Git Commit

Takes everything in the **staging area** and adds it to a commit object.

### Git Push

Pushes the new commits to the main **branch**.

### Git Pull

Retrieves any commits on the **remote branch** that you don’t yet have locally and integrates them into your **current branch**.

### Git Log

Gives you a linear series of **commits** going back in time. This is why we want small commits with good messages. This practice produces a readable, understandable codebase.

### Git Blame

Shows who last modified each line of a file and in which commit. You'll be given the line, commit message, and commit ID.

### Git Show

The command `git show <commit ID>` displays information about a specific commit.

### Git Stash

Takes any changes that haven't been committed and puts them in the stash (a dust bin for changes).

### Git Diff

Shows you the difference between two files in both a human-readable, so you can understand it, and machine-readable way, so that a computer, another program called Patch, can take the diff and transform the first file into the second file. Git is just using diff and patch to model your source code.

#### How To Read a Diff

When we read a diff, we look at the top of the file, and we see two different things. They will not be individual file names, they'll be called something like A and B when we're using Git, because we're going to be talking about the same file but different versions. The two files will have signs in from of them, --- for the first one, and +++ for the second one.

There are 3 types of lines in a file like this:

1.  Lines with nothing in front of them, which are lines which both files have in common.
2.  The lines with the minus sign in front of them, which are the lines which only occur in the first file.
3.  The lines with the plus signs in front of them, which are lines which only occur in the second file.

By reading the diff, we can transform version 1 (A) to version 2 (B) by adding the lines with pluses and removing the lines with minuses.

#### Using Patch

However, we can use **patch** utility (installed on any Unix system), which performs this for us!

Example of using `patch`:\
First, we use `diff` (works on any files, not just those tracked by Git) to compare 2 files - `vis_v1.R` and `vis_v2.R`.\
Using `-u` produces a unified diff, which is the standard patch format. `>` redirects the output to a file called `v1_to_v2.patch`.\
The patch file records all changes needed to transform `vis_v1.R` into `vis_v2.R`.

```         
diff -u vis_v1.R vis_v2.R > v1_to_v2.patch
```

Then, we apply the patch. The `patch` command applies a patch file to a file.  `-o /tmp/patched_version.R` tells patch to write the patched result to a new file instead of overwriting `vis_v1.R`, which is the base file.  `v1_to_v2.patch` is the patch file you generated.  After running this, `/tmp/patched_version.R` contains the same content as `vis_v2.R`.

```         
patch -o /tmp/patched_version.R vis_v1.R v1_to_v2.patch 
```

The `cat` command just prints the contents of the patched file, which will match `vis_v2.R`.

```         
cat /tmp/patched_version.R
```

### Git Checkout

Moves something from the **branch** to the **working copy**.

## Git Notes and Tips

1.  Be selective about what you're adding. Don't add everything.

-   The exception to this rule is when you have something totally new, and you've worked on it for a while and you've never committed it before. Then, you'll tend to make one big commit.
-   Why? Git really isn't meant to manage things except for text points (code, scripts, LaTex, Markdown, etc). It cannot easily track things like images because it stores them in full, so it can't show what changed like it could with a text file.

2.  Make small commit messages that explain what we've been doing.
3.  It's a little bit irregular to add data to a Git repository, but it's okay to add data to your Git repository if it's stored in a text-based format and it isn't too big.
4.  Use GitLFS (Git Large File Storage) to handle large files. It's an extension to Git that’s designed for handling large or binary files that Git alone doesn’t manage well.
5.  How do we know that we're looking at a Git repository and not just a directory? Inside of a Git repository, there's a special folder called .git, which is all of the data that the Git repository is managing.

## Interactive Staging

Interactive staging lets you carefully construct a series of commits, which is useful, because it allows you to not have to stop every couple lines of code to make a commit. First, look at `git diff` to see the file changes.

```         
cd ~/<repo>
git status
git diff 

git add -i
```

This gives us a text-based interactive menu.

```         
*** Commands ***

1: [s]tatus 2: [u]pdate 3: [r]evert 4: [a]dd untracked
5: [p]atch  6: [d]iff   7: [q]uit   8: [h]elp
```

We then want to create a patch, so we type `p`. It'll then give you a list of files that have been changed and ask what file you want to look at, and you'll type the number of the file. Press enter, and now we're in interactive staging.\
You'll see a menu that looks like:

```         
Stage this hunk [y,n,q,a,d,e,?]?
```

Each of these options is explained below:

-   `y` → stage this hunk
-   `n` → do not stage this hunk
-   `q` → quit, do not stage any more
-   `a` → stage this hunk and all remaining hunks
-   `d` → do not stage this hunk or any remaining hunks
-   `e` → manually edit this hunk
-   `?` → show help
-   `s` → splits large hunk into multiple hunks so you can be more detailed

Then, we go through each change shown in git diff and decide what to do with it. Once we get to the first change we want to stage, we type `y`, then enter, and then Control D to exit interactive staging, and say `git status`, we'll see that the file we have edited is in the changes to be committed. If we don't stage all changes, then the same file also shows up in the untracked files. Now, we'll make a commit.

```         
git commit -m "Your message here"
```

Then, you can continue staging remaining hunks in a new interactive session by starting it over. When the whole process is done, you can do `git push -u origin main`.
