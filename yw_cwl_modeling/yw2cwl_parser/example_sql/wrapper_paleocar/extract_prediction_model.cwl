#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 models: 
  type: string 
 
 pred_year: 
  type: string 
 
outputs: 
 prediction_graph: 
  type: string 
 
 prediction_model: 
  type: string 
 
baseCommand: 