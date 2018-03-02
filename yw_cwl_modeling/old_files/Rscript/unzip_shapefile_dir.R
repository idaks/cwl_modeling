# For testing th script if you want see commands on server terminal
# set techo=True
options(echo=TRUE)

## this option is used for taking the inputs from command line.


args <- commandArgs(trailingOnly = TRUE)

setwd(args[1])


dir_name = args[1]

file_name = paste0(paste0(args[2],'/'),args[3])

ext_dir = paste0(paste0(args[2],'/'),paste0(args[2],'_tracts'))


print(file_name)
print(dir_name)

utils::unzip(file_name, exdir=ext_dir)