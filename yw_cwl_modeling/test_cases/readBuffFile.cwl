#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
 readBuffer:
  type: string

outputs:
 logfile:
  type: File

baseCommand: