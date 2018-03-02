#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
 prism_data_of_sel_loc:
  type: string
 matrix_of_chronologies_calibration_year:
  type: string

outputs:
 car_scores:
  type: string
 

baseCommand: