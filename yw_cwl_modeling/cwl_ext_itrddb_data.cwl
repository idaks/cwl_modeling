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

  itrdb_rds: 
   type: string
   inputBinding:
    position: 3

outputs:
  out:
    type: File
    outputBinding:
      glob: $(inputs.study_region)/$(inputs.itrdb_rds)

baseCommand: [Rscript,/Users/pratikshrivastava/Desktop/Box/GitHub/cwl_modeling/yw_cwl_modeling/Rscript/ext_itrdb_data.R]
stdout: $(inputs.study_region)/$(inputs.itrdb_rds)