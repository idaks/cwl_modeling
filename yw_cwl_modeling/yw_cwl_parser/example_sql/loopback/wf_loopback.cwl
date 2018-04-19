
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
   input1_step1: input1_step1
   input2_step1: input2_step1
  out: [output1_step1] 
 step2: 
  run: step2.cwl 
  in: 
   input2_step1: input2_step1
  out: [output1_step2] 
 step3: 
  run: step3.cwl 
  in: 
   input: input
  out: [final_output] 
 