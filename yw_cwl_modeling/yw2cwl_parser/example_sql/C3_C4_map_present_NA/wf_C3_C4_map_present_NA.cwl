#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: Workflow 
requirements: 
  - class: SubworkflowFeatureRequirement 
inputs: 
 SYNMAP_land_cover_map_data: 
  type: string 
 
 mean_airtemp: 
  type: string 
 
 mean_precip: 
  type: string 
 
 num_col: 
  type: string 
 
 num_rows: 
  type: string 
 
outputs: 
  C3_fraction_data: 
   type: string 
   outputSource: generate_netcdf_file_for_C3_fraction/C3_fraction_data
  C4_fraction_data: 
   type: string 
   outputSource: generate_netcdf_file_for_C4_fraction/C4_fraction_data
  Grass_fraction_data: 
   type: string 
   outputSource: generate_netcdf_file_for_Grass_fraction/Grass_fraction_data
steps: 
 fetch_SYNMAP_land_cover_map_variable: 
  run: fetch_SYNMAP_land_cover_map_variable.cwl 
  in: 
   SYNMAP_land_cover_map_data: SYNMAP_land_cover_map_data
  out: [lat,lat_bnds,lon,lon_bnds] 
 fetch_monthly_mean_air_temperature_data: 
  run: fetch_monthly_mean_air_temperature_data.cwl 
  in: 
   mean_airtemp: mean_airtemp
  out: [Tair] 
 fetch_monthly_mean_precipitation_data: 
  run: fetch_monthly_mean_precipitation_data.cwl 
  in: 
   mean_precip: mean_precip
  out: [Rain] 
 initialize_Grass_Matrix: 
  run: initialize_Grass_Matrix.cwl 
  in: 
   num_col: num_col
   num_rows: num_rows
  out: [Grass] 
 examine_pixels_for_grass: 
  run: examine_pixels_for_grass.cwl 
  in: 
   Rain: fetch_monthly_mean_precipitation_data/Rain
   Tair: fetch_monthly_mean_air_temperature_data/Tair
  out: [C3,C4] 
 generate_netcdf_file_for_C3_fraction: 
  run: generate_netcdf_file_for_C3_fraction.cwl 
  in: 
   C3_Data: examine_pixels_for_grass/C3
   lat_bnds_variable: fetch_SYNMAP_land_cover_map_variable/lat_bnds
   lat_variable: fetch_SYNMAP_land_cover_map_variable/lat
   lon_bnds_variable: fetch_SYNMAP_land_cover_map_variable/lon_bnds
   lon_variable: fetch_SYNMAP_land_cover_map_variable/lon
  out: [C3_fraction_data] 
 generate_netcdf_file_for_C4_fraction: 
  run: generate_netcdf_file_for_C4_fraction.cwl 
  in: 
   C4_Data: examine_pixels_for_grass/C4
   lat_bnds_variable: fetch_SYNMAP_land_cover_map_variable/lat_bnds
   lat_variable: fetch_SYNMAP_land_cover_map_variable/lat
   lon_bnds_variable: fetch_SYNMAP_land_cover_map_variable/lon_bnds
   lon_variable: fetch_SYNMAP_land_cover_map_variable/lon
  out: [C4_fraction_data] 
 generate_netcdf_file_for_Grass_fraction: 
  run: generate_netcdf_file_for_Grass_fraction.cwl 
  in: 
   Grass_variable: initialize_Grass_Matrix/Grass
   lat_bnds_variable: fetch_SYNMAP_land_cover_map_variable/lat_bnds
   lat_variable: fetch_SYNMAP_land_cover_map_variable/lat
   lon_bnds_variable: fetch_SYNMAP_land_cover_map_variable/lon_bnds
   lon_variable: fetch_SYNMAP_land_cover_map_variable/lon
  out: [Grass_fraction_data] 
 