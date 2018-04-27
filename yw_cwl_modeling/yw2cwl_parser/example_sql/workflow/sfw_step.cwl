#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 sfw_s1: 
  type: string 
 
outputs: 
 sfw_s_out: 
  type: string 
 
baseCommand: 