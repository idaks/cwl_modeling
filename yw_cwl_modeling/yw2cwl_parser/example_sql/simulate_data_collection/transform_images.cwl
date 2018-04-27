#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 calibration_image: 
  type: string 
 
 energy: 
  type: string 
 
 frame_number: 
  type: string 
 
 raw_image_path: 
  type: string 
 
 sample_id: 
  type: string 
 
outputs: 
 corrected_image: 
  type: string 
 
 corrected_image_path: 
  type: string 
 
 pixel_count: 
  type: string 
 
 run_log: 
  type: string 
 
 total_intensity: 
  type: string 
 
baseCommand: 