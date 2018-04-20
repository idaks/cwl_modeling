#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 models: 
  type: string 
 
 pred_year: 
  type: string 
 
outputs: 
 uncertainty_graph: 
  type: string 
 
 uncertainty_model: 
  type: string 
 
baseCommand: 