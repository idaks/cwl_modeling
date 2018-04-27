# A repository for converting YesWorkflow models in to CWL

## CWL tool: 
* The Common Workflow Language (CWL)(https://github.com/common-workflow-language/), is a way to describe command line tools and connect them together to create workflows. Because CWL is a specification and not a specific piece of software, tools and workflows described using CWL are portable across a variety of platforms that support the CWL standard. 

## YesWorkflow: 
The yw-prototypes repository contains early implementations of YesWorkflow(https://github.com/yesworkflow-org/yw-prototypes), an approach to modeling conventional scripts and programs as scientific workflows. 


## Differences between the models. 
1. Execution Language Vs Modeling 
2. No Provenance Vs Provenance
3. Flexibility 
4. 


## Installing CWL: 

* Please follow the steps for installing CWL using. 


## 

## Executing yw2cwl.py 

* The script yw2cwl.py takes yesworkflow model facts file as input.  
* $ python yw2cwl.py  
* Enter the yw model filename:  **get_itrdb_data/get_itrdb_data.P**
* The CWL files will be created in the **example_sql/get_itrdb_data** folder. 
* Verify the CWL workflow file using the cwl-runner tool. 


## Creating CWL graph. 

* Once the CWL workflow file is created. 
* Use http://view.commonwl.org for generating the CWL graph, using the github link for the workflow file. 