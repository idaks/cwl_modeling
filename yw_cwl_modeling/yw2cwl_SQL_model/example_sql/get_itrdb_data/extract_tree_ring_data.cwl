
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 calib_years: 
  type: string 
 
 chronology_type: 
  type: string 
 
 extraction_dir: 
  type: string 
 
 force_redo: 
  type: string 
 
 label: 
  type: string 
 
 measurement_type: 
  type: string 
 
 polygon: 
  type: string 
 
 prediction_years: 
  type: string 
 
 raw_dir: 
  type: string 
 
outputs: 
 list: 
  type: string 
 
baseCommand: 