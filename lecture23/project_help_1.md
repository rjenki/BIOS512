# Lecture 21: Project Help

## 1) Add a README.md file.

Your README.md file should evolve over time to reflect the things you've done. We want someone to b able to read the README.md file and then be able to replicate your results.

## 2) Optional for the project, but good practice: Shell script!

This was the example given in class, which referred to an NFL data set, so naturally the container was called nfl.

``` sh
#!/bin/bash

docker build . -t nfl

docker run -p 8787:8787 -v $(pwd): home/rstudio/work -e PASSWORD=pwdnfl|
  -e USERID=$(id -u) -e GROUPID=$(id -g) -it nfl
```

You would save this as `start.sh`, then type `chmod +x start.sh` and `./start.sh` to run the script.

### 2a) Running R Studio from Docker

After running the shell script above, you'd go to <http://localhost:8787/> and log in with username=rstudio and password=pwdnfl.

### 3) AI Assistance

In this class, we used [Qwen](https://github.com/QwenLM/qwen-code) to help with coding. In the terminal on your local device, type:\
1. `docker exec --user root -it 99f8 /bin/bash`\
2. `npm install -g @qwen-code/qwen-code@latest`\
3. `qwen --version` Then, when you go to Rstudio, you should be able to type Qwen and get a response. Once there, you'll get a url that you need to click on, which gets you registered/logged in.

### 4) Scratch File

You can make a scratch file (`scratch.R`) to mess around with your data.\
1. Load your libraries.\
2. Read the data set in.\
For these next parts, you can do them in the Console instead of the file itself.\
3. Look at your columns. (`names()`)\
4. See the number of rows. (`nrow()`)\
5. Make tables that look into questions of interest.\
6. Use Qwen to generate things for you (and check behind the AI!).
