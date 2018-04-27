
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 cassette_id: 
  type: string 
 
 num_images: 
  type: string 
 
 accepted_sample: 
  type: string 
 
 energies: 
  type: string 
 
outputs: 
 sample_id: 
  type: string 
 
 energy: 
  type: string 
 
 frame_number: 
  type: string 
 
 raw_image_path: 
  type: string 
 
 run_log: 
  type: string 
 

baseCommand: 