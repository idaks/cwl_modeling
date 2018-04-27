
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 sample_score_cutoff: 
  type: string 
 
 data_redundancy: 
  type: string 
 
 sample_name: 
  type: string 
 
 sample_quality: 
  type: string 
 
outputs: 
 accepted_sample: 
  type: string 
 
 rejected_sample: 
  type: string 
 
 num_images: 
  type: string 
 
 energies: 
  type: string 
 

baseCommand: 