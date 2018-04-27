
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 zipfile: 
  type: string 
 
 dir_name: 
  type: string 
 
outputs: 
 shapefiles_dir: 
  type: string 
 
 layer_boundary: 
  type: string 
 
 layer_tracts: 
  type: string 
 
 metadata_xml_file: 
  type: string 
 
 tracts_xml_file: 
  type: string 
 

baseCommand: 