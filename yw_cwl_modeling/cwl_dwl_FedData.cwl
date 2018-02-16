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

  url: 
   type: string
   inputBinding:
    position: 3

outputs:
  out:
    type: File
    outputBinding:
      glob: data/$(inputs.study_region)/$(inputs.study_region)_tracts.zip

baseCommand: [Rscript,/Users/pratikshrivastava/Desktop/Box/GitHub/cwl_modeling/yw_cwl_modeling/Rscript/dwl_FedData.R]