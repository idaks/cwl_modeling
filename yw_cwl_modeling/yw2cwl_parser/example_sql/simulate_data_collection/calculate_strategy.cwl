#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 data_redundancy: 
  type: string 
 
 sample_name: 
  type: string 
 
 sample_quality: 
  type: string 
 
 sample_score_cutoff: 
  type: string 
 
outputs: 
 accepted_sample: 
  type: string 
 
 energies: 
  type: string 
 
 num_images: 
  type: string 
 
 rejected_sample: 
  type: string 
 
baseCommand: 