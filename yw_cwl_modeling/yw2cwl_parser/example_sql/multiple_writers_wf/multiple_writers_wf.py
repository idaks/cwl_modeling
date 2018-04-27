#@begin multiple_writers_wf
#@in wf_input1 
#@in wf_input2
#@in wf_input3

#@begin writer1 
#@in inp1 @as wf_input1
#@out out1 @as wf_output 
#@end writer1


#@begin writer2
#@in inp2 @as wf_input2 
#@out out2 @as wf_output 
#@end writer2

#@begin writer3 
#@in inp3 @as wf_input3
#@out out3 @as wf_output 
#@end writer3

#@out wf_output
#@end multiple_writers_wf