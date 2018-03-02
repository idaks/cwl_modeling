#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
 matrix_of_chronologies_pred_years:
  type: string

outputs:
 prediction_list:
  type: string

baseCommand: