
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement

inputs: 
 wf_input1: 
  type: string 
 
 wf_input2: 
  type: string 
 
 wf_input3: 
  type: string 
 
outputs: 
  wf_output: 
   type: string 
   outputSource: writer3/out3
steps: 
 writer1: 
  run: writer1.cwl 
  in: 
   inp1: wf_input1
  out: [out1] 
 writer2: 
  run: writer2.cwl 
  in: 
   inp2: wf_input2
  out: [out2] 
 writer3: 
  run: writer3.cwl 
  in: 
   inp3: wf_input3
  out: [out3] 
 