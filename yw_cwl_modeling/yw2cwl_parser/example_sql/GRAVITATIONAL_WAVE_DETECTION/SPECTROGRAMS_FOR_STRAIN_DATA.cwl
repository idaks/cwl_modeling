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
 spectrogram.png: 
  type: string 
 
baseCommand: 