## Installing/Running Docker
### Windows Users - Slightly Different Set Up
For Windows users I highly recommend using the instructions located here to set up Docker on your computer:
```
https://docs.docker.com/docker-for-windows/wsl/
```
This will help you set up both Windows Subsystem for Linux (which will allow you to run a Linux environment natively on Windows) and setting up the appropriate Docker install on top of it.

### Mac Users - (Mostly) Standard Set Up
Mac users can use the standard Docker install. Linux users will typically know what they want to do, but the short version is install Docker via the instructions appropriate to your distribution and make sure you are in the docker group.
```
https://docs.docker.com/desktop/setup/install/mac-install/
```
**Users of Apple Silicon Macs might find using the `rocker/verse` images upon which we base most of the course problematic (they are not compiled for ARM processors).** Someone has hacked together a version for Apple Silicon Macs:
```
https://github.com/elbamos/rstudio-m1
```
And you might be able to get the Rocker images running by enabling Rosetta. See this thread:
```
rocker-org/rocker-versioned2#144
```
