#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
  models: 
   type: string
  
  matches:
  	type: string
  
outputs:
  model_errors:
    type: File
  ceofficient_values: 
 	type: File

baseCommand: