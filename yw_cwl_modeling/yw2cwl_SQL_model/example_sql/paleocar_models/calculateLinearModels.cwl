#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 matches: 
  type: string 
 
 models: 
  type: string 
 
outputs: 
 coefficients: 
  type: string 
 
 model_errors: 
  type: string 
 
baseCommand: 