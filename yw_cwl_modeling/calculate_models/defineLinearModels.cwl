#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
 carscores: 
  type: string

 predictionlist:
  type: string

 max_no_predictor:
  type: string

outputs:
 models:
  type: string
 matches: 
  type: string

baseCommand: