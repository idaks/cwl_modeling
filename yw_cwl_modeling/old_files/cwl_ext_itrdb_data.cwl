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

  itrdb_rds: 
   type: string
   inputBinding:
    position: 3
  
  file_name:
    type: File

outputs:
  itrdb_data:
    type: File
    outputBinding:
      glob: $(inputs.itrdb_rds)

baseCommand: [Rscript,/Users/pratikshrivastava/Desktop/Box/GitHub/cwl_modeling/yw_cwl_modeling/Rscript/ext_itrdb_data.R]
stdout: $(inputs.itrdb_rds)