#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
 input1_step2:
  type: string

outputs:
 output_step2:
  type: string

baseCommand: