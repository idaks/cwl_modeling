#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
 input1_step3:
  type: string

outputs:
 output_step3:
  type: string

baseCommand: