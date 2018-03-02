#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
 prediction_years:
  type: string
 tree_ring_values: 
  type: string
 min_tree_width:
  type: string
  default: Null 

outputs:
 matrix_of_chronologies_pred_years:
  type: string

baseCommand: