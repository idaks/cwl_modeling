#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:

  dir: 
   type: string
   inputBinding:
    position: 1

  study_region: 
   type: string
   inputBinding:
    position: 2

outputs:
  out:
    type: File
    outputBinding:
      glob: data/$(inputs.study_region)/grca/$(inputs.study_region)_*

baseCommand: [Rscript,/Users/pratikshrivastava/Desktop/Box/GitHub/cwl_modeling/yw_cwl_modeling/Rscript/unzip_shapefile_dir.R]