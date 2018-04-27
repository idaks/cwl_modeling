#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: Workflow 
requirements: 
  - class: SubworkflowFeatureRequirement 
inputs: 
 Static_Tweets: 
  type: string 
 
outputs: 
  Sentiment_Result: 
   type: string 
   outputSource: DrawPieChart/plt
steps: 
 AccessTweets: 
  run: AccessTweets.cwl 
  in: 
   tweets_data_path: Static_Tweets
  out: [tweets_file] 
 CountSentiments: 
  run: CountSentiments.cwl 
  in: 
   tweets_file: AccessTweets/tweets_file
  out: [negative,neutral,positive] 
 Measures: 
  run: Measures.cwl 
  in: 
   negative: CountSentiments/negative
   neutral: CountSentiments/neutral
   positive: CountSentiments/positive
  out: [colors,explode,labels,sizes] 
 DrawPieChart: 
  run: DrawPieChart.cwl 
  in: 
   colors: Measures/colors
   explode: Measures/explode
   labels: Measures/labels
   sizes: Measures/sizes
  out: [plt] 
 