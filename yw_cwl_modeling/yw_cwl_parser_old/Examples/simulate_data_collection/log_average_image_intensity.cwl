
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 cassette_id: 
  type: string 
 
 sample_id: 
  type: string 
 
 frame_number: 
  type: string 
 
 corrected_image_path: 
  type: string 
 
 total_intensity: 
  type: string 
 
 pixel_count: 
  type: string 
 
outputs: 
 collection_log: 
  type: string 
 

baseCommand: 