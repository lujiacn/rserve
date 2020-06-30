# vim:set ft=dockerfile
FROM ubuntu:18.04
MAINTAINER lujiacn@gmail.com

RUN apt-get update && apt-get install -y gnupg

RUN sh -c 'echo "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/" >> /etc/apt/sources.list'
#RUN apt-key adv --keyserver keyserver.ubuntu.com --keyserver-options  http-proxy=http://192.168.65.1:3128 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN apt-key adv --keyserver keyserver.ubuntu.com --keyserver-options  --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
#RUN gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
#RUN gpg -a --export E084DAB9 | apt-key add -

RUN apt install ca-certificates
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
        cron \
        pandoc

RUN rm -rf /var/lib/apt/lists/*

# install R packages
COPY installed.R clean_tmp start.R Rserv.conf ./
RUN Rscript installed.R
RUN chmod +x clean_tmp \
    & mv clean_tmp /etc/cron.daily/ \
    & rm -rf /tmp/*

EXPOSE     6311
ENTRYPOINT R -e "Rserve::run.Rserve(remote=TRUE)"
