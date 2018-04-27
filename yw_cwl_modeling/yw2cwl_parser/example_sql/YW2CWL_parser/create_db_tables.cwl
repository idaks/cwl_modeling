#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 db_conn: 
  type: string 
 
outputs: 
 yw_tables: 
  type: string 
 
baseCommand: 