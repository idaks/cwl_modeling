#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 C4_Data: 
  type: string 
 
 lat_bnds_variable: 
  type: string 
 
 lat_variable: 
  type: string 
 
 lon_bnds_variable: 
  type: string 
 
 lon_variable: 
  type: string 
 
outputs: 
 C4_fraction_data: 
  type: string 
 
baseCommand: 