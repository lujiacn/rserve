# vim:set ft=dockerfile
# Dotcloud ubuntu image
FROM ubuntu:trusty
MAINTAINER lujiacn

# Install latest R
RUN sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
# add the public keys:
RUN gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
RUN gpg -a --export E084DAB9 | apt-key add -
 
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
		wget

# log R version
RUN R --version

#FROM ubuntu:trusty
#RUN apk add --update --no-cache musl-utils build-base R R-dev cairo-dev grep
#RUN apk add --no-cache gcc musl-dev libxml2-dev curl-dev openssl-dev
#RUN apk add --no-cache automake libtool m4 autoconf linux-headers

#FROM       rserve:latest

RUN R -e 'if (!require("devtools"))     {install.packages("devtools",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("BH"))           {install.packages("BH",           repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("DBI"))          {install.packages("DBI",          repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("R6"))           {install.packages("R6",           repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("RColorBrewer")) {install.packages("RColorBrewer", repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("RCurl"))        {install.packages("RCurl",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("Rcpp"))         {install.packages("Rcpp",         repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("RgoogleMaps"))  {install.packages("RgoogleMaps",  repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("Rserve"))       {install.packages("Rserve",       repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("assertthat"))   {install.packages("assertthat",   repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("base64"))       {install.packages("base64",       repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("base64enc"))    {install.packages("base64enc",    repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("bitops"))       {install.packages("bitops",       repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("chron"))        {install.packages("chron",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("clipr"))        {install.packages("clipr",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("colorspace"))   {install.packages("colorspace",   repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("crosstalk"))    {install.packages("crosstalk",    repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("data.table"))   {install.packages("data.table",   repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("dichromat"))    {install.packages("dichromat",    repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("digest"))       {install.packages("digest",       repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("dplyr"))        {install.packages("dplyr",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("evaluate"))     {install.packages("evaluate",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("exact2x2"))     {install.packages("exact2x2",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("exactci"))      {install.packages("exactci",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("formatR"))      {install.packages("formatR",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("gdtools"))      {install.packages("gdtools",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("geosphere"))    {install.packages("geosphere",    repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("ggmap"))        {install.packages("ggmap",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("ggplot2"))      {install.packages("ggplot2",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("googleVis"))    {install.packages("googleVis",    repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("gridExtra"))    {install.packages("gridExtra",    repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("gsDesign"))     {install.packages("gsDesign",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("gtable"))       {install.packages("gtable",       repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("highr"))        {install.packages("highr",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("htmltools"))    {install.packages("htmltools",    repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("htmlwidgets"))  {install.packages("htmlwidgets",  repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("httpuv"))       {install.packages("httpuv",       repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("jpeg"))         {install.packages("jpeg",         repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("jsonlite"))     {install.packages("jsonlite",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("knitr"))        {install.packages("knitr",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("labeling"))     {install.packages("labeling",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("lazyeval"))     {install.packages("lazyeval",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("leaflet"))      {install.packages("leaflet",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("magrittr"))     {install.packages("magrittr",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("mapproj"))      {install.packages("mapproj",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("maps"))         {install.packages("maps",         repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("markdown"))     {install.packages("markdown",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("mime"))         {install.packages("mime",         repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("mongolite"))    {install.packages("mongolite",    repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("munsell"))      {install.packages("munsell",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("openssl"))      {install.packages("openssl",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("plyr"))         {install.packages("plyr",         repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("png"))          {install.packages("png",          repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("proto"))        {install.packages("proto",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("pwr"))          {install.packages("pwr",          repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("raster"))       {install.packages("raster",       repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("reshape2"))     {install.packages("reshape2",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("rjson"))        {install.packages("rjson",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("scales"))       {install.packages("scales",       repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("sp"))           {install.packages("sp",           repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("ssanv"))        {install.packages("ssanv",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("stringi"))      {install.packages("stringi",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("stringr"))      {install.packages("stringr",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("svglite"))      {install.packages("svglite",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("tibble"))       {install.packages("tibble",       repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("vegalite"))     {install.packages("vegalite",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("viridis"))      {install.packages("viridis",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("webshot"))      {install.packages("webshot",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("xtable"))       {install.packages("xtable",       repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("yaml"))         {install.packages("yaml",         repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("zoo"))          {install.packages("zoo",          repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("KernSmooth"))   {install.packages("KernSmooth",   repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("MASS"))         {install.packages("MASS",         repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("Matrix"))       {install.packages("Matrix",       repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("base"))         {install.packages("base",         repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("boot"))         {install.packages("boot",         repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("class"))        {install.packages("class",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("cluster"))      {install.packages("cluster",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("codetools"))    {install.packages("codetools",    repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("compiler"))     {install.packages("compiler",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("datasets"))     {install.packages("datasets",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("foreign"))      {install.packages("foreign",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("grDevices"))    {install.packages("grDevices",    repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("graphics"))     {install.packages("graphics",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("grid"))         {install.packages("grid",         repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("lattice"))      {install.packages("lattice",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("methods"))      {install.packages("methods",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("mgcv"))         {install.packages("mgcv",         repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("nlme"))         {install.packages("nlme",         repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("nnet"))         {install.packages("nnet",         repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("parallel"))     {install.packages("parallel",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("rpart"))        {install.packages("rpart",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("spatial"))      {install.packages("spatial",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("splines"))      {install.packages("splines",      repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("stats"))        {install.packages("stats",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("stats4"))       {install.packages("stats4",       repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("survival"))     {install.packages("survival",     repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("tcltk"))        {install.packages("tcltk",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("tools"))        {install.packages("tools",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("utils"))        {install.packages("utils",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("shiny"))        {install.packages("shiny",        repos="https://cran.ism.ac.jp",dependencies=TRUE) };'
RUN R -e 'if (!require("ggvis"))        {devtools::install_github("lujiacn/ggvis")};'

EXPOSE     6311
ENTRYPOINT R -e "Rserve::run.Rserve(remote=TRUE)"
#CMD ["R", "CMD", "Rserve"]
