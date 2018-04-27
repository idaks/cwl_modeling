#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 fs: 
  type: string 
 
 strain_H1: 
  type: string 
 
 strain_L1: 
  type: string 
 
outputs: 
 GW150914_ASDs.png: 
  type: string 
 
 psd_H1: 
  type: string 
 
 psd_L1: 
  type: string 
 
baseCommand: 