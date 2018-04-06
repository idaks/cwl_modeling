
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
 
 raw_image_path: 
  type: string 
 
 calibration_image: 
  type: string 
 
outputs: 
 corrected_image: 
  type: string 
 
 corrected_image_path: 
  type: string 
 
 total_intensity: 
  type: string 
 
 pixel_count: 
  type: string 
 
 run_log: 
  type: string 
 

baseCommand: 