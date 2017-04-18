#!/bin/sh
#Downloading and installing LattE
wget https://www.math.ucdavis.edu/~latte/software/packages/latte_current/latte-integrale-1.7.3b.tar.gz 
tar -xzvf latte-integrale-1.7.3b.tar.gz
rm latte-integrale-1.7.3b.tar.gz

cd latte-integrale-1.7.3b
sudo apt-get install m4 -y
./congfigure
make

# this part of the script is installing R
sudo echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" | sudo tee -a /etc/apt/sources.list
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get install r-base r-base-dev -y --allow-unauthenticated

#This script is installing RStudio
sudo apt-get install gdebi-core
wget https://download1.rstudio.org/rstudio-1.0.136-amd64.deb
sudo gdebi -n rstudio-1.0.136-amd64.deb
rm rstudio-1.0.136-amd64.deb

#Installing R packages
#Changing the working directory to R
cd R
#These are troubleshooting problems with installing the package devtools in R 
sudo apt-get install libcurl4-openssl-dev -y
sudo apt-get install libssl-dev -y
#Now installing devtools
wget https://cran.r-project.org/src/contrib/devtools_1.12.0.tar.gz
R CMD INSTALL devtools_1.12.0.tar.gz

#Troubleshooting the m2r package
sudo apt-get install gmp.dev -y
