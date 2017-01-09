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


## pdf extract tool
#  # https://github.com/CrossRef/pdfextract
# use ruby in terminal, can extract referece part



## use system command in r
x = system('ruby "pdf-extract extract --references /Users/JIANCHEN/GitHub/Reference_Relationship/1403.2805.pdf"', intern=TRUE)
x



