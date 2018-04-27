
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement
inputs: 
  shapefile_archive: 
   type: string 
  study_region: 
   type: string 
  prediction_years: 
   type: string 
outputs: 
  itrdb: 
   type: string 
   outputSource: Not in ports list/list
steps: 
 create_shapefile_dir: 
  run: create_shapefile_dir.cwl 
  in: 
   dir_name: study_region
  out: [user_created_dir] 
 download_shapefile_archive: 
  run: download_shapefile_archive.cwl 
  in: 
   file_archive: shapefile_archive
   dir: create_shapefile_dir/user_created_dir
  out: [compressed_shapefile] 
 uncompress_shapefile: 
  run: uncompress_shapefile.cwl 
  in: 
   zipfile: download_shapefile_archive/compressed_shapefile
   dir_name: create_shapefile_dir/user_created_dir
  out: [shapefiles_dir , layer_boundary , layer_tracts , metadata_xml_file , tracts_xml_file] 
 read_shapefile: 
  run: read_shapefile.cwl 
  in: 
   layer: uncompress_shapefile/layer_boundary
   dir: uncompress_shapefile/shapefiles_dir
  out: [dataobject] 
 get_treepolygon: 
  run: get_treepolygon.cwl 
  in: 
   width: Not in ports list
   polygon: read_shapefile/dataobject
   quadsegs: Not in ports list
  out: [template] 
 extract_tree_ring_data: 
  run: extract_tree_ring_data.cwl 
  in: 
   polygon: get_treepolygon/template
   label: Parameter
   raw_dir: Parameter
   extraction_dir: Parameter
   prediction_years: prediction_years
   calib_years: Not in ports list
   measurement_type: Parameter
   chronology_type: Parameter
   force_redo: Parameter
  out: [list] 
 