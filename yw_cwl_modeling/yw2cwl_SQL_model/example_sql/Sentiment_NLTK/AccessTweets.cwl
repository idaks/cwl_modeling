#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 tweets_data_path: 
  type: string 
 
outputs: 
 tweets_file: 
  type: string 
 
baseCommand: 