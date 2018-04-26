#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 mean_precip: 
  type: string 
 
outputs: 
 Rain: 
  type: string 
 
baseCommand: 