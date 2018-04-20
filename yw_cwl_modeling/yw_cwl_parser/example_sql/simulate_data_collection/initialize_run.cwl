
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 cassette_id: 
  type: string 
 
 sample_score_cutoff: 
  type: string 
 
outputs: 
 run_log: 
  type: string 
 
baseCommand: 