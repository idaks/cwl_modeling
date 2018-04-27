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
    outputSource: step3/final_output

steps:
  step1:
    run: step1.cwl
    in:
      input1_step1: input1
      input2_step1: step3/final_output
    out: [output_step1]
 
  step2:
    run: step2.cwl
    in:
      input1_step2: step1/output_step1
    out: [output_step2]
  
  step3:
    run: wf_step3.cwl
    in:
      input1: step2/output_step2
    out: [final_output]
