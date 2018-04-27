#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 updated_tables: 
  type: string 
 
outputs: 
 updated_dataFrames: 
  type: string 
 
baseCommand: 