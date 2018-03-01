#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
 carscores: 
  type: string

 predictionlist:
  type: string

 predictor_matrix:
  type: string

outputs:
 models:
  type: string
 matches: 
  type: string

baseCommand: