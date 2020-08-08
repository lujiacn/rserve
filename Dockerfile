# vim:set ft=dockerfile
FROM ubuntu:18.04
MAINTAINER lujiacn@gmail.com
ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && apt-get install -y gnupg

# install cran-r40
RUN sh -c 'echo "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/" >> /etc/apt/sources.list'
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

RUN apt install -y ca-certificates
RUN apt-get update && apt-get install -y \
        r-base \
        r-recommended \
        r-base-dev \
        libcurl4-gnutls-dev \
        libxml2-dev \
        libmime-base64-urlsafe-perl \
        libdigest-hmac-perl \
        libdigest-sha-perl \
        libssl-dev \
        libapparmor1 \
        libcairo2-dev \
        wget \
        vim \
        cron \
        pandoc

RUN rm -rf /var/lib/apt/lists/*

# install R packages
COPY installed.R clean_tmp start.R Rserv.conf Rserve_1.8-7.tar.gz ./
RUN R CMD INSTALL Rserve_1.8-7.tar.gz
RUN Rscript installed.R
RUN chmod +x clean_tmp \
    & mv clean_tmp /etc/cron.daily/ \
    & rm -rf /tmp/* \
    & rm Rserve_1.8-7.tar.gz

EXPOSE     6311
ENTRYPOINT R -e "Rserve::run.Rserve(remote=TRUE)"
