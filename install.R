install.packages("tidyverse", dependencies = TRUE)
install.packages("rmarkdown", dependencies = TRUE)
install.packages("IRkernel", dependencies = TRUE)
install.packages("skimr", dependencies = TRUE)
IRkernel::installspec(user = FALSE)

system("wget https://github.com/quarto-dev/quarto-cli/releases/download/v2.12.0/quarto-2.12.0-linux-amd64.deb")
system("sudo dpkg -i quarto-2.12.0-linux-amd64.deb")
