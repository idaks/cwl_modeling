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

  itrdb_rds:
    type: string

outputs:
  ext_dir:
    type: File
    outputSource: ext_itrdb_data/itrdb_data


steps:
  dwl_Feddata:
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
      file_name: dwl_Feddata/out
    out: [out]

  ext_itrdb_data:
    run: cwl_ext_itrdb_data.cwl
    in:
      dir: dir
      study_region: study_region
      file_name: unzip/out
      itrdb_rds: itrdb_rds
    out: [itrdb_data]