#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 verbose: 
  type: string 
 
outputs: 
 _YW_OUT_print_message: 
  type: string 
 
baseCommand: 