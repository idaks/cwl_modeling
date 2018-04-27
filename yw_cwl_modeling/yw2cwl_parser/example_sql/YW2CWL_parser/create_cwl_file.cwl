#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 updated_dataFrames: 
  type: string 
 
outputs: 
 cwl_files: 
  type: string 
 
baseCommand: 