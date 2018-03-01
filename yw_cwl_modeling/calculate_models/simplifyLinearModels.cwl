#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
  model_errors:
    type: File
  ceofficient_values: 
 	type: File
  
outputs:
  linear_models:
  	type: File

baseCommand: