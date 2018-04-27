#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 strain_16: 
  type: string 
 
 strain_4: 
  type: string 
 
outputs: 
 GW150914_H1_ASD_SamplingRate.png: 
  type: string 
 
baseCommand: 