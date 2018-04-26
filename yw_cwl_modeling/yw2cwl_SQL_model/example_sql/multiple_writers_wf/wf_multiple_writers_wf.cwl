
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
   outputSource: _YW_PROG_5/_YW_OUT_YW_PROG_5
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
 _YW_PROG_5: 
  run: _YW_PROG_5.cwl 
  in: 
   _YW_IN_out1_12: writer1/out1
   _YW_IN_out2_13: writer2/out2
   _YW_IN_out3_14: writer3/out3
  out: [_YW_OUT_YW_PROG_5] 
 