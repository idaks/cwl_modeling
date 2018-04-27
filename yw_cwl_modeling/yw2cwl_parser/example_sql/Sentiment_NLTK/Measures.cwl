#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 negative: 
  type: string 
 
 neutral: 
  type: string 
 
 positive: 
  type: string 
 
outputs: 
 colors: 
  type: string 
 
 explode: 
  type: string 
 
 labels: 
  type: string 
 
 sizes: 
  type: string 
 
baseCommand: 