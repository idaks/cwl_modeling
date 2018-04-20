#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 dir: 
  type: string 
 
 layer: 
  type: string 
 
outputs: 
 dataobject: 
  type: string 
 
baseCommand: 