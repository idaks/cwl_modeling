#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 dataFrames: 
  type: string 
 
outputs: 
 updated_tables: 
  type: string 
 
baseCommand: 