#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 fn_d: 
  type: string 
 
 fn_sr: 
  type: string 
 
outputs: 
 strain_16: 
  type: string 
 
 strain_4: 
  type: string 
 
 strain_H1: 
  type: string 
 
 strain_L1: 
  type: string 
 
baseCommand: 