#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 num_col: 
  type: string 
 
 num_rows: 
  type: string 
 
outputs: 
 Grass: 
  type: string 
 
baseCommand: 