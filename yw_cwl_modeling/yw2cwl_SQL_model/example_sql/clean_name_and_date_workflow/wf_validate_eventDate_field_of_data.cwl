#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: Workflow 
requirements: 
  - class: SubworkflowFeatureRequirement 
inputs: 
 _YW_IN_input2_data: 
  type: string 
 
 output1_data: 
  type: string 
 
 record_id_data: 
  type: string 
 
outputs: 
  _YW_OUT_final_result: 
   type: string 
   outputSource: log_accepted_record/final_result
  _YW_OUT_final_result: 
   type: string 
   outputSource: log_accepted_record/final_result
  date_val_log: 
   type: string 
   outputSource: log_summary/date_val_log
  output2_data: 
   type: string 
   outputSource: validate_eventDate_field_of_data/output2_data
steps: 
 initialize_run: 
  run: initialize_run.cwl 
  in: 
  out: [date_val_log] 
 read_input2_data_records: 
  run: read_input2_data_records.cwl 
  in: 
   input2_data: _YW_IN_input2_data
   record_id_data: record_id_data
  out: [RecordID,date_val_log,original2_eventDate,original2_others] 
 check_empty_value: 
  run: check_empty_value.cwl 
  in: 
   original2_eventDate: read_input2_data_records/original2_eventDate
  out: [check_result,date_val_log,original2_eventDate,original2_eventDate] 
 log_rejected_record: 
  run: log_rejected_record.cwl 
  in: 
   RecordID: read_input2_data_records/RecordID
   check_result: check_empty_value/check_result
   original2_eventDate: check_empty_value/original2_eventDate
  out: [date_val_log,final_result,rejected2_record_count] 
 check_ISO_compliant: 
  run: check_ISO_compliant.cwl 
  in: 
   original2_eventDate: check_empty_value/original2_eventDate
  out: [date_val_log,match_result,original2_eventDate,original2_eventDate] 
 update_eventDate: 
  run: update_eventDate.cwl 
  in: 
   match_result: check_ISO_compliant/match_result
   original2_eventDate: check_ISO_compliant/original2_eventDate
  out: [date_val_log,updated2_eventDate] 
 log_accepted_record: 
  run: log_accepted_record.cwl 
  in: 
   RecordID: read_input2_data_records/RecordID
   original2_eventDate: check_ISO_compliant/original2_eventDate
   updated2_eventDate: update_eventDate/updated2_eventDate
  out: [accepted2_record_count,date_val_log,final_result] 
 write_output2_data: 
  run: write_output2_data.cwl 
  in: 
   original2_eventDate: check_ISO_compliant/original2_eventDate
   original2_eventDate: check_empty_value/original2_eventDate
   original2_others: read_input2_data_records/original2_others
   updated2_eventDate: update_eventDate/updated2_eventDate
  out: [output2_data] 
 log_summary: 
  run: log_summary.cwl 
  in: 
   accepted2_record_count: log_accepted_record/accepted2_record_count
   rejected2_record_count: log_rejected_record/rejected2_record_count
  out: [date_val_log] 
 