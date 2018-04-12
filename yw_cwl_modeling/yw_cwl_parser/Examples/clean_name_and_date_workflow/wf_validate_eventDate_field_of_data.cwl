
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement
inputs: 
  output1_data: 
   type: string 
  record_id_data: 
   type: string 
outputs: 
  output2_data: 
   type: string 
   outputSource: Not in ports list/output2_data
  date_val_log: 
   type: string 
   outputSource: Not in ports list/date_val_log
steps: 
 initialize_run: 
  run: initialize_run.cwl 
  in: 
  out: [] 
 read_input2_data_records: 
  run: read_input2_data_records.cwl 
  in: 
   input2_data: Parameter
   record_id_data: record_id_data
  out: [original2_eventDate , RecordID , original2_others , date_val_log] 
 check_empty_value: 
  run: check_empty_value.cwl 
  in: 
   original2_eventDate: read_input2_data_records/original2_eventDate
  out: [check_result , original2_eventDate , original2_eventDate , date_val_log] 
 log_rejected_record: 
  run: log_rejected_record.cwl 
  in: 
   RecordID: read_input2_data_records/RecordID
   original2_eventDate: check_empty_value/original2_eventDate
   check_result: check_empty_value/check_result
  out: [final_result , rejected2_record_count , date_val_log] 
 check_ISO_compliant: 
  run: check_ISO_compliant.cwl 
  in: 
   original2_eventDate: check_empty_value/original2_eventDate
  out: [match_result , original2_eventDate , original2_eventDate , date_val_log] 
 update_eventDate: 
  run: update_eventDate.cwl 
  in: 
   original2_eventDate: check_ISO_compliant/original2_eventDate
   match_result: check_ISO_compliant/match_result
  out: [updated2_eventDate , date_val_log] 
 log_accepted_record: 
  run: log_accepted_record.cwl 
  in: 
   RecordID: read_input2_data_records/RecordID
   updated2_eventDate: update_eventDate/updated2_eventDate
   original2_eventDate: check_ISO_compliant/original2_eventDate
  out: [final_result , accepted2_record_count , date_val_log] 
 write_output2_data: 
  run: write_output2_data.cwl 
  in: 
   original2_others: read_input2_data_records/original2_others
   updated2_eventDate: update_eventDate/updated2_eventDate
   original2_eventDate: check_ISO_compliant/original2_eventDate
   original2_eventDate: check_empty_value/original2_eventDate
  out: [output2_data] 
 log_summary: 
  run: log_summary.cwl 
  in: 
   accepted2_record_count: log_accepted_record/accepted2_record_count
   rejected2_record_count: log_rejected_record/rejected2_record_count
  out: [date_val_log] 
 