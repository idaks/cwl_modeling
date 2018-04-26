#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 historical_precip_data: 
  type: string 
 
 tree_ring_data: 
  type: string 
 
outputs: 
 itrdb: 
  type: string 
 
 prism_data: 
  type: string 
 
baseCommand: 