#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 mean_airtemp: 
  type: string 
 
outputs: 
 Tair: 
  type: string 
 
baseCommand: 