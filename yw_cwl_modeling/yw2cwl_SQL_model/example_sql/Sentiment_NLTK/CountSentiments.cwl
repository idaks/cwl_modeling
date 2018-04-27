#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 tweets_file: 
  type: string 
 
outputs: 
 negative: 
  type: string 
 
 neutral: 
  type: string 
 
 positive: 
  type: string 
 
baseCommand: 