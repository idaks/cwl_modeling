#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 C3_Data: 
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
 C3_fraction_data: 
  type: string 
 
baseCommand: 