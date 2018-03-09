#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
 input1_step1:
  type: string

 input2_step1:
  type: string 

outputs:
 output_step1:
  type: string

baseCommand: