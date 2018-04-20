
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 accepted_sample: 
  type: string 
 
 cassette_id: 
  type: string 
 
 energies: 
  type: string 
 
 num_images: 
  type: string 
 
outputs: 
 energy: 
  type: string 
 
 frame_number: 
  type: string 
 
 raw_image_path: 
  type: string 
 
 run_log: 
  type: string 
 
 sample_id: 
  type: string 
 
baseCommand: 