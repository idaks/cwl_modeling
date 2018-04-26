#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 carscores: 
  type: string 
 
 max_preds: 
  type: string 
 
 predlist: 
  type: string 
 
outputs: 
 matches: 
  type: string 
 
 models: 
  type: string 
 
baseCommand: 