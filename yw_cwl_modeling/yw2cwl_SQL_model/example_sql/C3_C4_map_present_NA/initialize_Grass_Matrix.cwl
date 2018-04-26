#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 _YW_IN_initialize_Grass_Matrix: 
  type: string 
 
outputs: 
 Grass: 
  type: string 
 
baseCommand: 