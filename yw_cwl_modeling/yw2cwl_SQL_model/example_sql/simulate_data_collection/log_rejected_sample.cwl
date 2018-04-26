#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 cassette_id: 
  type: string 
 
 rejected_sample: 
  type: string 
 
outputs: 
 rejection_log: 
  type: string 
 
baseCommand: 