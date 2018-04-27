#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 calibration_years: 
  type: string 
 
 itrdb: 
  type: string 
 
 label: 
  type: string 
 
 min_width: 
  type: string 
 
 prediction_years: 
  type: string 
 
 prism_data_for_coordinates: 
  type: string 
 
 verbose: 
  type: string 
 
outputs: 
 log_file: 
  type: string 
 
 pal_model: 
  type: string 
 
 pred_model: 
  type: string 
 
 pred_plot: 
  type: string 
 
 uncertain_model: 
  type: string 
 
 uncertain_plot: 
  type: string 
 
baseCommand: 