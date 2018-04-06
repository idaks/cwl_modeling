
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement
inputs: 
  cassette_id: 
   type: string 
  sample_score_cutoff: 
   type: string 
  data_redundancy: 
   type: string 
  sample_spreadsheet: 
   type: string 
  calibration_image_file: 
   type: string 
outputs: 
  corrected_image: 
   type: string 
   outputSource: transform_images/corrected_image_file
  run_log: 
   type: string 
   outputSource: initialize_run/run_log
  collection_log: 
   type: string 
   outputSource: log_average_image_intensity/collection_log
  rejection_log: 
   type: string 
   outputSource: log_rejected_sample/rejection_log
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
   sample_spreadsheet_file: sample_spreadsheet
  out: [sample_name , sample_quality , run_log] 
 calculate_strategy: 
  run: calculate_strategy.cwl 
  in: 
   sample_score_cutoff: sample_score_cutoff
   data_redundancy: data_redundancy
   sample_name: load_screening_results/sample_name
   sample_quality: load_screening_results/sample_quality
  out: [accepted_sample , rejected_sample , num_images , energies] 
 log_rejected_sample: 
  run: log_rejected_sample.cwl 
  in: 
   cassette_id: cassette_id
   rejected_sample: calculate_strategy/rejected_sample
  out: [rejection_log] 
 collect_data_set: 
  run: collect_data_set.cwl 
  in: 
   cassette_id: cassette_id
   num_images: calculate_strategy/num_images
   accepted_sample: calculate_strategy/accepted_sample
   energies: calculate_strategy/energies
  out: [sample_id , energy , frame_number , raw_image_file , run_log] 
 transform_images: 
  run: transform_images.cwl 
  in: 
   sample_id: collect_data_set/sample_id
   energy: collect_data_set/energy
   frame_number: collect_data_set/frame_number
   raw_image_file: collect_data_set/raw_image_file
   calibration_image_file: calibration_image_file
  out: [corrected_image_file , total_intensity , pixel_count , run_log] 
 log_average_image_intensity: 
  run: log_average_image_intensity.cwl 
  in: 
   cassette_id: cassette_id
   sample_id: collect_data_set/sample_id
   frame_number: collect_data_set/frame_number
   total_intensity: transform_images/total_intensity
   pixel_count: transform_images/pixel_count
   corrected_image_file: transform_images/corrected_image_file
  out: [collection_log] 
 