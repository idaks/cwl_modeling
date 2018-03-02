#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool

inputs:
 Verbose:
  type: boolean

outputs:
 messages:
  stdout

baseCommand: