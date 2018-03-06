# vim:set ft=dockerfile
FROM ubuntu:trusty
MAINTAINER lujiacn@gmail.com

# Install latest R
RUN sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list' \
        & gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 \
        & gpg -a --export E084DAB9 | apt-key add -

# Update and install
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
        pandoc \
    && rm -rf /var/lib/apt/lists/*

# install R packages
COPY install_package.R clean_tmp ./
RUN Rscript install_package.R \
    & chmod +x clean_tmp \
    & mv clean_tmp /etc/cron.daily/ \
    & rm -rf /tmp/*

EXPOSE     6311
ENTRYPOINT R -e "Rserve::run.Rserve(remote=TRUE)"
