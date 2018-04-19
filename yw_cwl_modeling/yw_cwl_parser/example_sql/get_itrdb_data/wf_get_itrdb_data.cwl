
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
   dir_name: dir_name
  out: [user_created_dir] 
 download_shapefile_archive: 
  run: download_shapefile_archive.cwl 
  in: 
   dir: dir
   file_archive: file_archive
  out: [compressed_shapefile] 
 uncompress_shapefile: 
  run: uncompress_shapefile.cwl 
  in: 
   dir_name: dir_name
   zipfile: zipfile
  out: [layer_boundary,layer_tracts,metadata_xml_file,shapefiles_dir,tracts_xml_file] 
 read_shapefile: 
  run: read_shapefile.cwl 
  in: 
   dir: dir
   layer: layer
  out: [dataobject] 
 get_treepolygon: 
  run: get_treepolygon.cwl 
  in: 
   polygon: polygon
   quadsegs: quadsegs
   width: width
  out: [template] 
 extract_tree_ring_data: 
  run: extract_tree_ring_data.cwl 
  in: 
   calib_years: calib_years
   chronology_type: chronology_type
   extraction_dir: extraction_dir
   force_redo: force_redo
   label: label
   measurement_type: measurement_type
   polygon: polygon
   prediction_years: prediction_years
   raw_dir: raw_dir
  out: [list] 
 