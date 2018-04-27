#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 colors: 
  type: string 
 
 explode: 
  type: string 
 
 labels: 
  type: string 
 
 sizes: 
  type: string 
 
outputs: 
 plt: 
  type: string 
 
baseCommand: 