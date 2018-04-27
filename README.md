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

* Please follow the steps for installing CWL (https://github.com/common-workflow-language/cwltool). 


## 

## Installing YW2CWL parser. Using Github (requires installation of git)

* Install git from https://git-scm.com/downloads
* Open your command line tool (CMD for windows and terminal for Mac or Linux)
* Go to a directory where you would like to clone the repository
* Run git clone https://github.com/idaks/cwl_modeling.git

## Executing yw2cwl.py 

* The script yw2cwl.py takes yesworkflow model facts file as input. 
* Run the following command from command prompt
``` 
$ python yw2cwl.py  
```
* Enter the YW model filename:  
```
Enter the YW model filename:  **get_itrdb_data/get_itrdb_data.P**
```
* The CWL files will be created in the **example_sql/get_itrdb_data** folder. 
* Verify the CWL workflow file using the cwl-runner tool. 


## Creating CWL graph. 

* Once the CWL workflow file is created. 
* Use http://view.commonwl.org for generating the CWL graph, using the github link for the workflow file. 