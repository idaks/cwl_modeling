
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement
inputs: 
  wf_in1: 
   type: string 
  wf_in2: 
   type: string 
outputs: 
  wf_out: 
   type: string 
   outputSource: sub_workflow/swf_out
steps: 
 wf_step: 
  run: wf_step.cwl 
  in: 
   in1: wf_in1
   in2: wf_in2
  out: [out1] 
 sub_workflow: 
  run: sub_workflow.cwl 
  in: 
   sfw_1: wf_step/out1
  out: [swf_out] 
 