#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
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
  classout:
    type: File
    outputSource: unzip/out


steps:
  dwl_data:
    run: cwl_dwl_FedData.cwl
    in:
      dir: dir
      study_region: study_region
      url: url
    out: [out]

  unzip:
    run: cwl_unzip_shapefile.cwl
    in:
      dir: dir
      study_region: study_region
      file_name: dwl_data/out
    out: [out]
