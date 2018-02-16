# For testing th script if you want see commands on server terminal
# set techo=True
options(echo=TRUE)

## this option is used for taking the inputs from command line.


args <- commandArgs(trailingOnly = TRUE)

setwd(args[1])

dir_name = paste0(paste0('./',args[2]),'/') 

print(dir_name)

file_name=paste0(args[2],'_tracts.zip')

print(file_name)

utils::unzip(paste0(dir_name,file_name), exdir=paste0(dir_name,"/grca_tracts"))
