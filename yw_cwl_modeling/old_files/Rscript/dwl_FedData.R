# For testing th script if you want see commands on server terminal
# set techo=True
options(echo=FALSE)

## this option is used for taking the inputs from command line.

args <- commandArgs(trailingOnly = TRUE)


library(FedData)
setwd(args[1])

study_region=args[2]

dir.create(study_region, showWarnings = T, recursive = T)

FedData::download_data(args[3], destdir=paste0("./",study_region))

