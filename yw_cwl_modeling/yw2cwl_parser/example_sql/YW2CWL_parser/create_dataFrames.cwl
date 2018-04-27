#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 yw_tables: 
  type: string 
 
outputs: 
 dataFrames: 
  type: string 
 
baseCommand: 