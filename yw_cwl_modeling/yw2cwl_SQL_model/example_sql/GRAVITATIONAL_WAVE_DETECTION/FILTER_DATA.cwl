#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 coefs: 
  type: string 
 
 strain_H1: 
  type: string 
 
 strain_L1: 
  type: string 
 
outputs: 
 GW150914_filter.png: 
  type: string 
 
 strain_H1_filt: 
  type: string 
 
 strain_L1_filt: 
  type: string 
 
baseCommand: 