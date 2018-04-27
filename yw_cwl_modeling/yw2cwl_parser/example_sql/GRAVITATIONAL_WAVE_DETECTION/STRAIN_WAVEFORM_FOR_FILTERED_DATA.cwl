#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 strain_H1_filt: 
  type: string 
 
 strain_L1_filt: 
  type: string 
 
outputs: 
 GW150914_H1_strain_filtered.png: 
  type: string 
 
 GW150914_H1_strain_unfiltered.png: 
  type: string 
 
baseCommand: 