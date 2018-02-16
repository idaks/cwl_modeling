#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:

  dir: 
   type: string
   inputBinding:
    position: 1

  prism_file: 
   type: string
   inputBinding:
    position: 2

outputs:
  out:
    type: stdout

baseCommand: [ Rscript,/Users/pratikshrivastava/Desktop/Box/GitHub/cwl_modeling/yw_cwl_modeling/Rscript/raster_extent.R ]