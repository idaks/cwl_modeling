#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement

inputs:
  inFile: 
   type: File

  inMessage: 
   type: string

  readBuf: 
   type: string
  
  param: 
   type: boolean
  
outputs:
  logfile1:
    type: File
    outputSource: readParamPrintMessage/logfile

  logfile2:
    type: File
    outputSource: concatInput/logfile
  
  logfile3:
    type: File
    outputSource: readBuffFile/logfile

steps:
  concatInput:
    run: concatInput.cwl
    in:
      readFile: inFile
      readInputMessage: inMessage
    out: [logfile]
 
  readBuffFile:
    run: readBuffFile.cwl
    in:
      readBuffer: readBuf
    out: [logfile]

  readParamPrintMessage: 
    run: readParamPrintMessage.cwl
    in:
      verbose: param
    out: [logfile]