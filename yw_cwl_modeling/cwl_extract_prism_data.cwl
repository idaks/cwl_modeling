#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:

  dir: 
   type: string
   inputBinding:
    position: 1

  lat: 
   type: string
   inputBinding:
    position: 2

  long: 
   type: string
   inputBinding:
    position: 3

  prism_file: 
   type: string
   inputBinding:
    position: 4

  outfile: 
   type: string
   inputBinding:
    position: 5

  outdir: 
   type: string
   inputBinding:
    position: 6

outputs:
  out:
    type: File
    outputBinding:
      glob: $(inputs.outdir)/$(inputs.outfile)

baseCommand: [Rscript,/Users/pratikshrivastava/Desktop/Box/GitHub/cwl_modeling/yw_cwl_modeling/Rscript/extract_prism_data.R]