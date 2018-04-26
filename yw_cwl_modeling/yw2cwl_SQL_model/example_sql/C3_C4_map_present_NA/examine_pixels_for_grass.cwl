#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 Rain: 
  type: string 
 
 Tair: 
  type: string 
 
outputs: 
 C3: 
  type: string 
 
 C4: 
  type: string 
 
baseCommand: 