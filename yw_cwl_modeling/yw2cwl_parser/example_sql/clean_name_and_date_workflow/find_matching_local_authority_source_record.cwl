#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 local_authority_source_scientificName_lst: 
  type: string 
 
 original_scientificName: 
  type: string 
 
outputs: 
 final_result: 
  type: string 
 
 match_result: 
  type: string 
 
 matching_local_authority_source_record: 
  type: string 
 
 matching_local_authority_source_record: 
  type: string 
 
 matching_local_authority_source_record: 
  type: string 
 
 matching_method: 
  type: string 
 
 name_val_log: 
  type: string 
 
baseCommand: 