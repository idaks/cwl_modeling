
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement

inputs: 
 input1_data: 
  type: string 
 
 local_authority_source: 
  type: string 
 
outputs: 
  _YW_OUT_match_result: 
   type: string 
   outputSource: find_matching_local_authority_source_record/match_result
  _YW_OUT_matching_local_authority_source_record: 
   type: string 
   outputSource: find_matching_local_authority_source_record/matching_local_authority_source_record
  _YW_OUT_matching_method: 
   type: string 
   outputSource: find_matching_local_authority_source_record/matching_method
  name_val_log: 
   type: string 
   outputSource: log_summary/name_val_log
  output1_data: 
   type: string 
   outputSource: write_output1_data/output1_data
  record_id_data: 
   type: string 
   outputSource: read_input1_data_records/record_id_data
steps: 
 initialize_run: 
  run: initialize_run.cwl 
  in: 
  out: [name_val_log] 
 read_scientificName: 
  run: read_scientificName.cwl 
  in: 
   local_authority_source: local_authority_source
  out: [local_authority_source_scientificName_lst] 
 read_input1_data_records: 
  run: read_input1_data_records.cwl 
  in: 
   input1_data: input1_data
  out: [RecordID,name_val_log,original_authorship,original_others,original_scientificName,record_id_data] 
 check_empty_value: 
  run: check_empty_value.cwl 
  in: 
   original_scientificName: read_input1_data_records/original_scientificName
  out: [check_result,name_val_log,original_scientificName,original_scientificName] 
 log_rejected_record: 
  run: log_rejected_record.cwl 
  in: 
   RecordID: read_input1_data_records/RecordID
   check_result: check_empty_value/check_result
   original_scientificName: check_empty_value/original_scientificName
  out: [final_result,name_val_log,rejected_record_count] 
 find_matching_local_authority_source_record: 
  run: find_matching_local_authority_source_record.cwl 
  in: 
   local_authority_source_scientificName_lst: read_scientificName/local_authority_source_scientificName_lst
   original_scientificName: check_empty_value/original_scientificName
  out: [final_result,match_result,matching_local_authority_source_record,matching_local_authority_source_record,matching_local_authority_source_record,matching_method,name_val_log] 
 log_rejected_unmatching_record: 
  run: log_rejected_unmatching_record.cwl 
  in: 
   RecordID: read_input1_data_records/RecordID
   matching_local_authority_source_record: find_matching_local_authority_source_record/matching_local_authority_source_record
   original_scientificName: check_empty_value/original_scientificName
  out: [name_val_log,rejected_record_count] 
 update_scientificName: 
  run: update_scientificName.cwl 
  in: 
   matching_local_authority_source_record: find_matching_local_authority_source_record/matching_local_authority_source_record
   original_scientificName: check_empty_value/original_scientificName
  out: [updated_scientificName] 
 update_authorship: 
  run: update_authorship.cwl 
  in: 
   matching_local_authority_source_record: find_matching_local_authority_source_record/matching_local_authority_source_record
   original_authorship: read_input1_data_records/original_authorship
  out: [updated_authorship] 
 log_updated_record: 
  run: log_updated_record.cwl 
  in: 
   original_authorship: read_input1_data_records/original_authorship
   original_scientificName: check_empty_value/original_scientificName
   updated_authorship: update_authorship/updated_authorship
   updated_scientificName: update_scientificName/updated_scientificName
  out: [name_val_log] 
 log_accepted_record: 
  run: log_accepted_record.cwl 
  in: 
   RecordID: read_input1_data_records/RecordID
   final_result: log_rejected_record/final_result
   original_scientificName: check_empty_value/original_scientificName
  out: [accepted_record_count,name_val_log] 
 write_output1_data: 
  run: write_output1_data.cwl 
  in: 
   original_authorship: read_input1_data_records/original_authorship
   original_others: read_input1_data_records/original_others
   original_scientificName: check_empty_value/original_scientificName
   original_scientificName: check_empty_value/original_scientificName
   updated_authorship: update_authorship/updated_authorship
   updated_scientificName: update_scientificName/updated_scientificName
  out: [output1_data] 
 log_summary: 
  run: log_summary.cwl 
  in: 
   accepted_record_count: log_accepted_record/accepted_record_count
   rejected_record_count: log_rejected_record/rejected_record_count
  out: [name_val_log] 
 