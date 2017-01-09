# Reference Relationship Tool

setwd("/Users/JIANCHEN/GitHub/Reference_Relationship")

## pdf processing toolbox
install.packages("pdftools")
require(pdftools)

txt <- pdf_text("1403.2805.pdf")
txt

info <- pdf_info("1403.2805.pdf")
info

fontspdf <- pdf_fonts("1403.2805.pdf")

attachments <- pdf_attachments("1403.2805.pdf")
attachments

toc <- pdf_toc("1403.2805.pdf")
a <- jsonlite::toJSON(toc, auto_unbox = TRUE, pretty = TRUE)
a





## metadata request
install.packages("dplyr") # The devtools package provides install_github() that enables installing packages from GitHub.
library(devtools)
install_github('rmetadata', 'ropensci') # uncomment to install
library(rmetadata)
# For DataCite.
count_identifiers("datacite")
print(crossref_citation("10.3998/3336451.0009.101"), style = "Bibtex")


## install pdf extract tool in your macOS (my version is 10.12.2) via Terminal
#  # https://github.com/CrossRef/pdfextract
# use ruby in terminal, can extract referece part
# Open Terminal
#   sudo gem pdf-extract
#   sudo gem uninstall pdf-reader              # remove old version 
#   sudo gem install pdf-reader -v 1.2.0       # install version 1.2.0



## use system command in r
# get reference part of a pdf document
ref = system("pdf-extract extract --references /Users/JIANCHEN/GitHub/Reference_Relationship/pdfs/1403.2805.pdf", intern=TRUE)
ref[22]
ref = system("pdf-extract extract --references /Users/JIANCHEN/GitHub/Reference_Relationship/pdfs/4.pdf", intern=TRUE)
ref[30]


