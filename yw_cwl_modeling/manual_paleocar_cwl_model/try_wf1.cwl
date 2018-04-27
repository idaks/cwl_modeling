#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:

  dir: 
   type: string

outputs:
  Shapefiles:
    type: File
    outputSource: dwl_FedData/Shapefiles

steps:
  dwl_FedData:
    run: fetch_FedData.cwl
    in:
      baseDir: dir
    out: [Shapefiles]

