
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 user_map_marker_pos: 
  type: string 
 
 user_prediction_years: 
  type: string 
 
outputs: 
 coordinates: 
  type: string 
 
 prediction_years: 
  type: string 
 
 run_id: 
  type: string 
 
 session_id: 
  type: string 
 
baseCommand: 