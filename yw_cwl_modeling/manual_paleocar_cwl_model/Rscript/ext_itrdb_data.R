# For testing th script if you want see commands on server terminal
# set techo=True
options(echo=TRUE)

## this option is used for taking the inputs from command line.
library(FedData)

args <- commandArgs(trailingOnly = TRUE)

setwd(args[1])
getwd()

dir_name = args[1]

 
ext_dir = paste0(paste0(args[2],'/'),paste0(args[2],'_tracts'))

#ext_dir = args[2]

file_name = paste0(paste0(ext_dir,'/'),args[3])


grca <- rgdal::readOGR(ext_dir, layer='GRCA_boundary')
#grca <- rgdal::readOGR(ext_dir , layer=paste0(dir_name, '_boundary'))

#grca <- rgdal::writeOGR(grca, dsn = dir_name, layer = "grca", driver = "ESRI Shapefile", overwrite_layer = FALSE)



##### ITRDB DATA For GRCA 


## Set the calibration period
# Here, we use a 60 year period ending at 1983 
# to maximize the number of dendro series.
calibration.years <- 1924:1983 

## Set the retrodiction years (AD)
prediction.years <- 1:2000

## Set a spatial buffer around the area you wish to reconstruct
## from which to grab tree-ring chronologies. This will probably
## be in degrees.
tree.buffer <- 10

treePoly <- suppressWarnings(rgeos::gBuffer(grca, width=tree.buffer, quadsegs=1000))
# extract the re-whitened residuals of the tree-ring chronologies


# itrdb <- FedData::get_itrdb(template=treePoly, label="GRCA_PLUS_10DEG")
                            
                            # , recon_years=prediction.years, 
                            # calib_years=calibration.years, measurement.type="Ring Width", chronology.type="ARSTND", force_redo = TRUE)

#unlink("./data-raw/ITRDB_GRCA", recursive = T)

itrdb <- readr::read_rds(file_name)

Encoding(levels(itrdb$metadata$NAME)) <- "latin1"
levels(itrdb$metadata$NAME) <- iconv(
  levels(itrdb$metadata$NAME), 
  "latin1", 
  "UTF-8"
)

Encoding(levels(itrdb$metadata$CONTRIBUTOR)) <- "latin1"
levels(itrdb$metadata$CONTRIBUTOR) <- iconv(
  levels(itrdb$metadata$CONTRIBUTOR), 
  "latin1", 
  "UTF-8"
)

#devtools::use_data(itrdb, overwrite = TRUE)

readr::write_rds(itrdb,
                 file_name,
                 compress = "gz")