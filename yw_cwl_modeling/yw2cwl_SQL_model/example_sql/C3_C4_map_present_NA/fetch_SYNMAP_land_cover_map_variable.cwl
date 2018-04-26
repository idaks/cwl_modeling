#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 SYNMAP_land_cover_map_data: 
  type: string 
 
outputs: 
 lat: 
  type: string 
 
 lat_bnds: 
  type: string 
 
 lon: 
  type: string 
 
 lon_bnds: 
  type: string 
 
baseCommand: 