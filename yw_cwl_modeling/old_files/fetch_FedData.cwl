#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
  baseDir: 
   type: string

outputs:
  Shapefiles:
    type: File

baseCommand: 