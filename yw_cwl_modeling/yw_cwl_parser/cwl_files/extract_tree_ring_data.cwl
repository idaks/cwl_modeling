
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 polygon: 
  type: string 
 
 label: 
  type: string 
 
 raw_dir: 
  type: string 
 
 extraction_dir: 
  type: string 
 
 prediction_years: 
  type: string 
 
 calib_years: 
  type: string 
 
 measurement_type: 
  type: string 
 
 chronology_type: 
  type: string 
 
 force_redo: 
  type: string 
 
outputs: 
 list: 
  type: string 
 

baseCommand: 