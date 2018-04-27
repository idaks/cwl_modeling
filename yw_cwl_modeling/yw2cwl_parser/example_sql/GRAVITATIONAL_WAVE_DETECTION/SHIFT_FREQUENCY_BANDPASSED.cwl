#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 strain_H1_whitenbp: 
  type: string 
 
 strain_L1_whitenbp: 
  type: string 
 
outputs: 
 strain_H1_shifted: 
  type: string 
 
 strain_L1_shifted: 
  type: string 
 
baseCommand: 