#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 fs: 
  type: string 
 
outputs: 
 coefs: 
  type: string 
 
baseCommand: 