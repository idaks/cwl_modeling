#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 coefficients: 
  type: string 
 
 model.errors: 
  type: string 
 
outputs: 
 final.models: 
  type: string 
 
baseCommand: 