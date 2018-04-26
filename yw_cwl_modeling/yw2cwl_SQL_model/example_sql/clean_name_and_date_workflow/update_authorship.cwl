#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 matching_local_authority_source_record: 
  type: string 
 
 original_authorship: 
  type: string 
 
outputs: 
 updated_authorship: 
  type: string 
 
baseCommand: 