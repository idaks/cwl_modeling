
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement

inputs: 
 calibration_image: 
  type: string 
 
 cassette_id: 
  type: string 
 
 data_redundancy: 
  type: string 
 
 sample_score_cutoff: 
  type: string 
 
 sample_spreadsheet: 
  type: string 
 
outputs: 
  collection_log: 
   type: string 
   outputSource: log_average_image_intensity/collection_log
  corrected_image: 
   type: string 
   outputSource: transform_images/corrected_image
  rejection_log: 
   type: string 
   outputSource: log_rejected_sample/rejection_log
  run_log: 
   type: string 
   outputSource: _YW_PROG_12/_YW_OUT_YW_PROG_12
steps: 
 initialize_run: 
  run: initialize_run.cwl 
  in: 
   cassette_id: cassette_id
   sample_score_cutoff: sample_score_cutoff
  out: [run_log] 
 load_screening_results: 
  run: load_screening_results.cwl 
  in: 
   cassette_id: cassette_id
   sample_spreadsheet: sample_spreadsheet
  out: [run_log,sample_name,sample_quality] 
 calculate_strategy: 
  run: calculate_strategy.cwl 
  in: 
   data_redundancy: data_redundancy
   sample_name: load_screening_results/sample_name
   sample_quality: load_screening_results/sample_quality
   sample_score_cutoff: sample_score_cutoff
  out: [accepted_sample,energies,num_images,rejected_sample] 
 log_rejected_sample: 
  run: log_rejected_sample.cwl 
  in: 
   cassette_id: cassette_id
   rejected_sample: calculate_strategy/rejected_sample
  out: [rejection_log] 
 collect_data_set: 
  run: collect_data_set.cwl 
  in: 
   accepted_sample: calculate_strategy/accepted_sample
   cassette_id: cassette_id
   energies: calculate_strategy/energies
   num_images: calculate_strategy/num_images
  out: [energy,frame_number,raw_image_path,run_log,sample_id] 
 transform_images: 
  run: transform_images.cwl 
  in: 
   calibration_image: calibration_image
   energy: collect_data_set/energy
   frame_number: collect_data_set/frame_number
   raw_image_path: collect_data_set/raw_image_path
   sample_id: collect_data_set/sample_id
  out: [corrected_image,corrected_image_path,pixel_count,run_log,total_intensity] 
 log_average_image_intensity: 
  run: log_average_image_intensity.cwl 
  in: 
   cassette_id: cassette_id
   corrected_image_path: transform_images/corrected_image_path
   frame_number: collect_data_set/frame_number
   pixel_count: transform_images/pixel_count
   sample_id: collect_data_set/sample_id
   total_intensity: transform_images/total_intensity
  out: [collection_log] 
 _YW_PROG_12: 
  run: _YW_PROG_12.cwl 
  in: 
   _YW_IN_run_log_76: initialize_run/run_log
   _YW_IN_run_log_77: load_screening_results/run_log
   _YW_IN_run_log_78: collect_data_set/run_log
   _YW_IN_run_log_79: transform_images/run_log
  out: [_YW_OUT_YW_PROG_12] 
 