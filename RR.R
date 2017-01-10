# Reference Relationship Tool
# Jian Chen
# 09/01/2017

setwd("/Users/JIANCHEN/GitHub/Reference_Relationship")

## install pdf extract tool in your macOS (my version is 10.12.2) via Terminal
#  use ruby in terminal, can extract referece part
# https://github.com/CrossRef/pdfextract
# 
# Open Terminal and input command: 
#   sudo gem pdf-extract
#   sudo gem uninstall pdf-reader              # remove current version 
#   sudo gem install pdf-reader -v 1.2.0       # install version 1.2.0


# set pdf file path
pdfpath <- c("/Users/JIANCHEN/GitHub/Reference_Relationship/pdfs/")

# remove spaces in folder names
pathname <- list.dirs(path = pdfpath, full.names = TRUE, recursive = TRUE)
pathname_new <- stri_replace_all_fixed(pathname, " ", "_")
file.rename(from = pathname, to = pathname_new)

# find all pdf filenames in the given folder
pdfname <- list.files(pdfpath,recursive = TRUE) # list all filenames (including subfolders (no space in folder name))

# remove spaces in filenames
library(stringi)
pdfname_new <- stri_replace_all_fixed(pdfname, " ", "_")  # replace space with underscore
# rename pdf files
file.rename(from = paste0(pdfpath,pdfname), to = paste0(pdfpath,pdfname_new))


## use system command in r to get reference and title of a pdf document
paper <- list()
papers <- list()
fileindex <- character()
systemcmd_ref <- character()
systemcmd_tit <- character()

for (i in 1:length(pdfname_new)){
  
  fileindex[i] <- paste(pdfpath,pdfname_new[i],sep = "")
  systemcmd_ref[i] <- paste("pdf-extract extract --references ",fileindex[i])
  systemcmd_tit[i] <- paste("pdf-extract extract --titles ",fileindex[i])
  
  paper$ref <- system(systemcmd_ref[i], intern=TRUE)  # get reference using system command and pdfextract tool
  paper$title <- system(systemcmd_tit[i], intern=TRUE) # get title using system command and pdfextract tool
  var_paper <- paste('paper',i,sep = "")
  papers[[var_paper]] <- paper
}



