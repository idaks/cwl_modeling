# @begin workflow
# @in wf_in1
# @in wf_in2
# @out wf_out

#     @begin wf_step
#     @in in1  @as wf_in1
#     @in in2  @as wf_in2
#     @out out1
#     @end wf_step

#     @begin sub_workflow
#     @in sfw_1  @as out1
#     @out swf_out  @as wf_out

#         @begin sfw_step
#         @in sfw_s1  @as sfw_1
#         @out sfw_s_out
#         @end sfw_step  @as swf_out
#     @end sub_workflow

# @end workflow
