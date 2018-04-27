#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 yw_model_file: 
  type: string 
 
 yw_tables: 
  type: string 
 
outputs: 
 yw_db_model: 
  type: string 
 
baseCommand: 