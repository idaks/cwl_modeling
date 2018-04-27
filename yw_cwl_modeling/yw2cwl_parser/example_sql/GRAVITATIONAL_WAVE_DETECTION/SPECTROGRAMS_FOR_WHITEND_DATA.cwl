#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 fs: 
  type: string 
 
 strain_H1_whiten: 
  type: string 
 
 strain_L1_whiten: 
  type: string 
 
outputs: 
 spectrogram_whitened.png: 
  type: string 
 
baseCommand: 