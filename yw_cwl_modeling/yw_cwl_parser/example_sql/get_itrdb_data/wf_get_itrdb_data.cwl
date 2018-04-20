
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement

inputs: 
 _YW_IN_calib_years: 
  type: string 
 
 _YW_IN_chronology_type: 
  type: string 
 
 _YW_IN_extraction_dir: 
  type: string 
 
 _YW_IN_force_redo: 
  type: string 
 
 _YW_IN_label: 
  type: string 
 
 _YW_IN_measurement_type: 
  type: string 
 
 _YW_IN_quadsegs: 
  type: string 
 
 _YW_IN_raw_dir: 
  type: string 
 
 _YW_IN_width: 
  type: string 
 
 prediction_years: 
  type: string 
 
 shapefile_archive: 
  type: string 
 
 study_region: 
  type: string 
 
outputs: 
  _YW_OUT_layer_tracts: 
   type: string 
   outputSource: uncompress_shapefile/layer_tracts
  _YW_OUT_metadata_xml_file: 
   type: string 
   outputSource: uncompress_shapefile/metadata_xml_file
  _YW_OUT_tracts_xml_file: 
   type: string 
   outputSource: uncompress_shapefile/tracts_xml_file
  itrdb: 
   type: string 
   outputSource: extract_tree_ring_data/list
steps: 
 create_shapefile_dir: 
  run: create_shapefile_dir.cwl 
  in: 
   dir_name: study_region
  out: [user_created_dir] 
 download_shapefile_archive: 
  run: download_shapefile_archive.cwl 
  in: 
   dir: create_shapefile_dir/user_created_dir
   file_archive: shapefile_archive
  out: [compressed_shapefile] 
 uncompress_shapefile: 
  run: uncompress_shapefile.cwl 
  in: 
   dir_name: create_shapefile_dir/user_created_dir
   zipfile: download_shapefile_archive/compressed_shapefile
  out: [layer_boundary,layer_tracts,metadata_xml_file,shapefiles_dir,tracts_xml_file] 
 read_shapefile: 
  run: read_shapefile.cwl 
  in: 
   dir: uncompress_shapefile/shapefiles_dir
   layer: uncompress_shapefile/layer_boundary
  out: [dataobject] 
 get_treepolygon: 
  run: get_treepolygon.cwl 
  in: 
   polygon: read_shapefile/dataobject
   quadsegs: _YW_IN_quadsegs
   width: _YW_IN_width
  out: [template] 
 extract_tree_ring_data: 
  run: extract_tree_ring_data.cwl 
  in: 
   calib_years: _YW_IN_calib_years
   chronology_type: _YW_IN_chronology_type
   extraction_dir: _YW_IN_extraction_dir
   force_redo: _YW_IN_force_redo
   label: _YW_IN_label
   measurement_type: _YW_IN_measurement_type
   polygon: get_treepolygon/template
   prediction_years: prediction_years
   raw_dir: _YW_IN_raw_dir
  out: [list] 
 