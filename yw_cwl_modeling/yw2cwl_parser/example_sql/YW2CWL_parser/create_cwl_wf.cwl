#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 cwl_files: 
  type: string 
 
 updated_dataFrames: 
  type: string 
 
outputs: 
 cwl_wf_files: 
  type: string 
 
baseCommand: 