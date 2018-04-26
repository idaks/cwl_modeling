#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 original_authorship: 
  type: string 
 
 original_scientificName: 
  type: string 
 
 updated_authorship: 
  type: string 
 
 updated_scientificName: 
  type: string 
 
outputs: 
 name_val_log: 
  type: string 
 
baseCommand: 