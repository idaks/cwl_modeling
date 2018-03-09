#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement

inputs:
  input1: 
   type: string

outputs:
  final_output:
    type: string
    outputSource: step3/output_step3

steps:
  step3:
    run: step3.cwl
    in:
      input1_step3: input1
    out: [output_step3]
 
 