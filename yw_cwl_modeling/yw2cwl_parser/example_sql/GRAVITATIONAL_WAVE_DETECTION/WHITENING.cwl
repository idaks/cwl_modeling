#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 psd_H1: 
  type: string 
 
 psd_L1: 
  type: string 
 
outputs: 
 strain_H1_whiten: 
  type: string 
 
 strain_L1_whiten: 
  type: string 
 
baseCommand: 