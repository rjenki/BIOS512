# Docker
Docker is a containerization engine. The idea is to let you specify, in a simple text format, what a computer needs to do a certain job. Docker reads that specification, builds the computer, and lets you run it.  
  
This originated for software engineering use cases, especially reproducible deployments. Historically, software projects and the machines on which they run were configured and maintained separately, which led to tricky, error-prone setups. Docker lets engineers develop software and a specification for the machine on which that software should run.  
  
Why should a data scientist care? Because data science pipelines also run in a context, and you want that context to be as reproducible as the rest of your work.  

## The Big Idea
A good data science project should include its own Dockerfile with instructions for running the code in the specified container. Anyone who has your code and can run Docker can likely run it immediately. Even if a user can't build/run containers, the Dockerfile is a compact description of what's needed to run the code.

## Installing Docker
### Windows Users - Slightly Different Set Up
For Windows users I highly recommend using the instructions located here to set up Docker on your computer:
```
https://docs.docker.com/docker-for-windows/wsl/
```
This will help you set up both Windows Subsystem for Linux (which will allow you to run a Linux environment natively on Windows) and setting up the appropriate Docker install on top of it.

### Mac Users - (Mostly) Standard Set Up
Mac users can use the standard Docker install. Linux users will typically know what they want to do, but the short version is install Docker via the instructions appropriate to your distribution and make sure you are in the docker group.

**Users of Apple Silicon Macs might find using the `rocker/verse` images upon which we base most of the course problematic (they are not compiled for ARM processors).** Someone has hacked together a version for Apple Silicon Macs:
```
https://github.com/elbamos/rstudio-m1
```
And you might be able to get the Rocker images running by enabling Rosetta. See this thread:
```
rocker-org/rocker-versioned2#144
```

## Using Docker
After installing it, check that it works with `docker run hello-world` in your **bash** shell. You should receive a `Hello from Docker!` message.

Most containers used here are based on `rocker/verse`. To access it and get a shell:
```bash
docker run -it rocker/verse /bin/bash
```
**Note for Apple Silicon Mac Users!**
You'll have to force docker to use the right image by specifying the platform.
```bash
docker run --platform linux/amd64 -it rocker/verse /bin/bash
```

After doing this, you'll see a prompt like:
```bash
root@3a111a544c6e:/#
```
To exit this, type `exit`.

### Rocker!
Rocker allows us to open a Rstudio server inside a container.
#### Here's how to run it:
1. Install Docker and confirm it's working.
2. Run the following command: `docker run -it -p 8787:8787 rocker/verse`.
   - For Apple Silicon users, you'll specify the platform again: `docker run --platform linux/amd64 -it -p 8787:8787 rocker/verse`
3. The output of this should give you a password:
   ```
   The password is set to aeSh0neeshood3oh.
   ```
   You can also specify a password by adding `-e PASSWORD=<YOUR_PASS>` before `-p`.
4. Go to http://localhost:8787/.
5. Once you're there, the username is rstudio and the password is the one you got from the output.
6. Congrats, run Rstudio!

#### Communicating Between Outside and Inside Computer
You'll want to set up a place for your files, or move the files you have into your Rstudio server. You can do so by:
```
docker run -it -p 8787:8787 -v <DIRECTORY FROM COMPUTER>:/home/rstudio/<DIRECTORY FOR SERVER> rocker/verse
```
For me, who is on Apple Silicon, it would look like this:
```
docker run --platform linux/amd64 -it -p 8787:8787 -v /Users/rebeccajenkins/BIOS512:/home/rstudio/work rocker/verse
```
Now, when I log in, I will see eveything that was in my BIOS512 directory on my computer in the work directory in the RStudio server.

## Dockerfile
A Dockerfile allows us to create a custom Docker container. 
### Example Dockerfile
```
FROM rocker/verse
RUN apt -y update && apt install -y man-db
RUN yes | unminimize
RUN R -e "install.packages('matlab');"
```
### Using the Dockerfile To Make A Container
The name of the Dockerfile is just Dockerfile. To use it, we'll run the following in bash: 
```
docker build . -t babysfirstcontainer
```
This assumes that the Dockerfile is in the current working directory. If you are an Apple Silicon user, you'll use `docker build --platform linux/amd64 -t babysfirstcontainer .`. For me, this took ~5 min to build.

### Running The Container We Built
Now, instead of saying `rocker/verse`, we'll say `babysfirstcontainer`.
```
docker run --platform linux/amd64 -it -p 8787:8787 -v /Users/rebeccajenkins/BIOS512:/home/rstudio/work babysfirstcontainer
```
Then, when we get into RStudio, we can run `library(matlab)` in the console to see that it has already been installed. 

### Finding/Killing Containers
To find running containers, do `docker ps`. To kill a container, use `docker kill <container_name_or_id>`. 

## Shell Script
If we don't want to type this in every time, we can make a shell script (`start.sh`) that runs it for us:
```
#! /bin/bash

docker build . -t babysfirstcontainer

docker run -v $(pwd): /home/rstudio/work\
    -e PASSWORD=pwd\
    -p 8787:8787 -it babysfirstcontainer
```
Then, we can type the following into the command line:
```
chmod +x start.sh
./start.sh
```
Note: `start_silicon.sh` is for Apple Silicon users.
