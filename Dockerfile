####### DOCKER START #######
FROM ubuntu:14.04

MAINTAINER venkata chandrasekhar nainala (mailcs76@gmail.com)

RUN echo "deb http://mirrors.ebi.ac.uk/CRAN/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list && \
	gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 && \
	gpg -a --export E084DAB9 | sudo apt-key add -

# Upgrading R to latest version
RUN sudo apt-get update && \
	sudo apt-get -y upgrade && \
	sudo apt-get install -y r-base r-base-dev

RUN sudo apt-get install -y libnetcdf-dev
RUN sudo apt-get install -y libcurl4-openssl-dev
RUN sudo apt-get install -y libxml2-dev
RUN sudo apt-get install -y libssl-dev
RUN sudo apt-get install -y libssh2-1-dev

RUN sudo apt-get install -y git
RUN sudo git clone https://github.com/CS76/docker-bioconductor.git
RUN sudo Rscript docker-bioconductor/install-xcms.R

