#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: Workflow 
requirements: 
  - class: SubworkflowFeatureRequirement 
inputs: 
 fn_d: 
  type: string 
 
 fn_sr: 
  type: string 
 
 fs: 
  type: string 
 
outputs: 
  GW150914_ASDs.png: 
   type: string 
   outputSource: AMPLITUDE_SPECTRAL_DENSITY/GW150914_ASDs.png
  GW150914_H1_ASD_SamplingRate.png: 
   type: string 
   outputSource: DOWNSAMPLING/GW150914_H1_ASD_SamplingRate.png
  GW150914_H1_strain_filtered.png: 
   type: string 
   outputSource: STRAIN_WAVEFORM_FOR_FILTERED_DATA/GW150914_H1_strain_filtered.png
  GW150914_H1_strain_unfiltered.png: 
   type: string 
   outputSource: STRAIN_WAVEFORM_FOR_FILTERED_DATA/GW150914_H1_strain_unfiltered.png
  GW150914_filter.png: 
   type: string 
   outputSource: FILTER_DATA/GW150914_filter.png
  GW150914_strain_whitened.png: 
   type: string 
   outputSource: STRAIN_WAVEFORM_FOR_WHITENED_DATA/GW150914_strain_whitened.png
  shifted.wav: 
   type: string 
   outputSource: WAVE_FILE_GENERATOR_FOR_SHIFTED_DATA/shifted.wav
  spectrogram.png: 
   type: string 
   outputSource: SPECTROGRAMS_FOR_STRAIN_DATA/spectrogram.png
  spectrogram_whitened.png: 
   type: string 
   outputSource: SPECTROGRAMS_FOR_WHITEND_DATA/spectrogram_whitened.png
  whitenbp.wav: 
   type: string 
   outputSource: WAVE_FILE_GENERATOR_FOR_WHITENED_DATA/whitenbp.wav
steps: 
 LOAD_DATA: 
  run: LOAD_DATA.cwl 
  in: 
   fn_d: fn_d
   fn_sr: fn_sr
  out: [strain_16,strain_4,strain_H1,strain_L1] 
 AMPLITUDE_SPECTRAL_DENSITY: 
  run: AMPLITUDE_SPECTRAL_DENSITY.cwl 
  in: 
   fs: fs
   strain_H1: LOAD_DATA/strain_H1
   strain_L1: LOAD_DATA/strain_L1
  out: [GW150914_ASDs.png,psd_H1,psd_L1] 
 WHITENING: 
  run: WHITENING.cwl 
  in: 
   psd_H1: AMPLITUDE_SPECTRAL_DENSITY/psd_H1
   psd_L1: AMPLITUDE_SPECTRAL_DENSITY/psd_L1
  out: [strain_H1_whiten,strain_L1_whiten] 
 BANDPASSING: 
  run: BANDPASSING.cwl 
  in: 
   strain_H1_whiten: WHITENING/strain_H1_whiten
   strain_L1_whiten: WHITENING/strain_L1_whiten
  out: [strain_H1_whitenbp,strain_L1_whitenbp] 
 STRAIN_WAVEFORM_FOR_WHITENED_DATA: 
  run: STRAIN_WAVEFORM_FOR_WHITENED_DATA.cwl 
  in: 
   strain_H1_whitenbp: BANDPASSING/strain_H1_whitenbp
   strain_L1_whitenbp: BANDPASSING/strain_L1_whitenbp
  out: [GW150914_strain_whitened.png] 
 SPECTROGRAMS_FOR_STRAIN_DATA: 
  run: SPECTROGRAMS_FOR_STRAIN_DATA.cwl 
  in: 
   fs: fs
   strain_H1: LOAD_DATA/strain_H1
   strain_L1: LOAD_DATA/strain_L1
  out: [spectrogram.png] 
 SPECTROGRAMS_FOR_WHITEND_DATA: 
  run: SPECTROGRAMS_FOR_WHITEND_DATA.cwl 
  in: 
   fs: fs
   strain_H1_whiten: WHITENING/strain_H1_whiten
   strain_L1_whiten: WHITENING/strain_L1_whiten
  out: [spectrogram_whitened.png] 
 FILTER_COEFS: 
  run: FILTER_COEFS.cwl 
  in: 
   fs: fs
  out: [coefs] 
 FILTER_DATA: 
  run: FILTER_DATA.cwl 
  in: 
   coefs: FILTER_COEFS/coefs
   strain_H1: LOAD_DATA/strain_H1
   strain_L1: LOAD_DATA/strain_L1
  out: [GW150914_filter.png,strain_H1_filt,strain_L1_filt] 
 STRAIN_WAVEFORM_FOR_FILTERED_DATA: 
  run: STRAIN_WAVEFORM_FOR_FILTERED_DATA.cwl 
  in: 
   strain_H1_filt: FILTER_DATA/strain_H1_filt
   strain_L1_filt: FILTER_DATA/strain_L1_filt
  out: [GW150914_H1_strain_filtered.png,GW150914_H1_strain_unfiltered.png] 
 WAVE_FILE_GENERATOR_FOR_WHITENED_DATA: 
  run: WAVE_FILE_GENERATOR_FOR_WHITENED_DATA.cwl 
  in: 
   strain_H1_whitenbp: BANDPASSING/strain_H1_whitenbp
   strain_L1_whitenbp: BANDPASSING/strain_L1_whitenbp
  out: [whitenbp.wav] 
 SHIFT_FREQUENCY_BANDPASSED: 
  run: SHIFT_FREQUENCY_BANDPASSED.cwl 
  in: 
   strain_H1_whitenbp: BANDPASSING/strain_H1_whitenbp
   strain_L1_whitenbp: BANDPASSING/strain_L1_whitenbp
  out: [strain_H1_shifted,strain_L1_shifted] 
 WAVE_FILE_GENERATOR_FOR_SHIFTED_DATA: 
  run: WAVE_FILE_GENERATOR_FOR_SHIFTED_DATA.cwl 
  in: 
   strain_H1_shifted: SHIFT_FREQUENCY_BANDPASSED/strain_H1_shifted
   strain_L1_shifted: SHIFT_FREQUENCY_BANDPASSED/strain_L1_shifted
  out: [shifted.wav] 
 DOWNSAMPLING: 
  run: DOWNSAMPLING.cwl 
  in: 
   strain_16: LOAD_DATA/strain_16
   strain_4: LOAD_DATA/strain_4
  out: [GW150914_H1_ASD_SamplingRate.png] 
 