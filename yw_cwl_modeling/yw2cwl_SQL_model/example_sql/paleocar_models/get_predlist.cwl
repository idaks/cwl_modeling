#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 reconstruction_matrix: 
  type: string 
 
outputs: 
 predlist: 
  type: string 
 
baseCommand: 