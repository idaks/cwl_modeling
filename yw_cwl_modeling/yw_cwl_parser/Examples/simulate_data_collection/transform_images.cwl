
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 sample_id: 
  type: string 
 
 energy: 
  type: string 
 
 frame_number: 
  type: string 
 
 raw_image_file: 
  type: string 
 
 calibration_image_file: 
  type: string 
 
outputs: 
 corrected_image_file: 
  type: string 
 
 total_intensity: 
  type: string 
 
 pixel_count: 
  type: string 
 
 run_log: 
  type: string 
 

baseCommand: 