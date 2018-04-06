
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
  out: [output1_step1] 
 step2: 
  run: step2.cwl 
  in: 
   input2_step1: step1/output1_step1
  out: [output1_step2] 
 step3: 
  run: step3.cwl 
  in: 
   input: step2/output1_step2
  out: [final_output] 
 