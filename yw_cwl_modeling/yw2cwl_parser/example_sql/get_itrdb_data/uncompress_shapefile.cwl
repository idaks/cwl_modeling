#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 dir_name: 
  type: string 
 
 zipfile: 
  type: string 
 
outputs: 
 layer_boundary: 
  type: string 
 
 layer_tracts: 
  type: string 
 
 metadata_xml_file: 
  type: string 
 
 shapefiles_dir: 
  type: string 
 
 tracts_xml_file: 
  type: string 
 
baseCommand: 