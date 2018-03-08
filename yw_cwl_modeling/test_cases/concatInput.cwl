#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
 readFile:
  type: File

 readInputMessage:
  type: string 

outputs:
 logfile:
  type: string

baseCommand: