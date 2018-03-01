#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
 model_errors:
  type: string
 coefficient_values: 
  type: string
  
outputs:
 linear_models:
  type: string

baseCommand: