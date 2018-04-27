#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 base_dir: 
  type: string 
 
 yw_model_file: 
  type: string 
 
outputs: 
 db_conn: 
  type: string 
 
baseCommand: 