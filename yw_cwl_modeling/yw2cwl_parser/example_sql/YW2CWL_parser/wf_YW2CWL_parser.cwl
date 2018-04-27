#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: Workflow 
requirements: 
  - class: SubworkflowFeatureRequirement 
inputs: 
 base_dir: 
  type: string 
 
 yw_model_file: 
  type: string 
 
outputs: 
  cwl_wf_files: 
   type: string 
   outputSource: create_cwl_wf/cwl_wf_files
  yw_db_model: 
   type: string 
   outputSource: _YW_PROG_13/_YW_OUT_YW_PROG_13
steps: 
 create_db_conn: 
  run: create_db_conn.cwl 
  in: 
   base_dir: base_dir
   yw_model_file: yw_model_file
  out: [db_conn] 
 create_db_tables: 
  run: create_db_tables.cwl 
  in: 
   db_conn: create_db_conn/db_conn
  out: [yw_tables] 
 create_yw_db_model: 
  run: create_yw_db_model.cwl 
  in: 
   yw_model_file: yw_model_file
   yw_tables: create_db_tables/yw_tables
  out: [yw_db_model] 
 create_dataFrames: 
  run: create_dataFrames.cwl 
  in: 
   yw_tables: create_db_tables/yw_tables
  out: [dataFrames] 
 create_missing_cwl_ports: 
  run: create_missing_cwl_ports.cwl 
  in: 
   dataFrames: create_dataFrames/dataFrames
  out: [updated_tables] 
 chk_prog_wo_output_port: 
  run: chk_prog_wo_output_port.cwl 
  in: 
   dataFrames: create_dataFrames/dataFrames
  out: [updated_tables] 
 check_danglingports: 
  run: check_danglingports.cwl 
  in: 
   dataFrames: create_dataFrames/dataFrames
  out: [updated_tables] 
 check_multiwriter_prog: 
  run: check_multiwriter_prog.cwl 
  in: 
   dataFrames: create_dataFrames/dataFrames
  out: [updated_tables] 
 reload_dataFrames: 
  run: reload_dataFrames.cwl 
  in: 
   updated_tables: create_yw_db_model/yw_db_model
  out: [updated_dataFrames] 
 create_cwl_file: 
  run: create_cwl_file.cwl 
  in: 
   updated_dataFrames: reload_dataFrames/updated_dataFrames
  out: [cwl_files] 
 create_cwl_wf: 
  run: create_cwl_wf.cwl 
  in: 
   cwl_files: create_cwl_file/cwl_files
   updated_dataFrames: reload_dataFrames/updated_dataFrames
  out: [cwl_wf_files] 
 _YW_PROG_13: 
  run: _YW_PROG_13.cwl 
  in: 
   _YW_IN_updated_tables_32: create_missing_cwl_ports/updated_tables
   _YW_IN_updated_tables_33: chk_prog_wo_output_port/updated_tables
   _YW_IN_updated_tables_34: check_danglingports/updated_tables
   _YW_IN_updated_tables_35: check_multiwriter_prog/updated_tables
   _YW_IN_yw_db_model_31: create_yw_db_model/yw_db_model
  out: [_YW_OUT_YW_PROG_13] 
 