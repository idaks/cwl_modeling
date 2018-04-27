#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 strain_H1_whitenbp: 
  type: string 
 
 strain_L1_whitenbp: 
  type: string 
 
outputs: 
 GW150914_strain_whitened.png: 
  type: string 
 
baseCommand: 