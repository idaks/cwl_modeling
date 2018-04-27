#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:

  baseDir: 
   type: string
   inputBinding:
    position: 1

  study_region: 
   type: string
   inputBinding:
    position: 2

  URL: 
   type: string
   inputBinding:
    position: 3

outputs:
  Shapefiles:
    type: File
    outputBinding:
      glob: $(inputs.study_region)/$(inputs.study_region)_tracts.zip

baseCommand: [Rscript,/Users/pratikshrivastava/Desktop/Box/GitHub/cwl_modeling/yw_cwl_modeling/Rscript/dwl_FedData.R]
stdout: $(inputs.study_region)/$(inputs.study_region)_tracts.zip