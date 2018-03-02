#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
 calibration_years:
  type: string
 tree_ring_values: 
  type: string
 min_tree_width:
  type: string
  default: Null 

outputs:
 matrix_of_chronologies_calibration_year:
  type: string
 max_no_predictor:
  type: string

baseCommand: