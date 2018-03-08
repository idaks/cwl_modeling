#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
 verbose:
  type: boolean

outputs:
 logfile:
  type: File

baseCommand: