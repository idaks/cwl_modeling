
#!/usr/bin/python



'''
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
This script is used for converting the yw model files into                                 +
CWL workflow files 										                                   +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                                                                                           +
version  |  date     |  author   |  comment
--------------------------------------------------------------------------------------------
1.0      |  04/20/18 | pratik  | intial version.                                         +
--------------------------------------------------------------------------------------------
                                                                                           +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'''



import os
import re
import pandas as pd
from collections import defaultdict
import sqlite3


def extract_steps(line):
    
    #% FACT: program(program_id, program_name, qualified_program_name, begin_annotation_id, end_annotation_id).
    ## Extract data between "(" and ")".
    data = line[line.index("(")+1:line.index(")")]
    
    data = data.split(',') 
    
    ins_query = [data[0].strip().strip("'"),data[1].strip().strip("'"),data[2].strip().strip("'")]
    conn.execute("""insert into steps values(?,?,?)""", ins_query)
    conn.commit()
    return
### function extracting the workflow.

def extract_workflows(line):
    
    #print(line)
    data = line[line.index("(")+1:line.index(")")]
    number = ''.join(data)
    
    conn.execute("""insert into workflow values(?)""",[number])
    conn.commit()
      
    return

### function extracting the ports

def extract_ports(line):
    #print("Extracting ports.")
    ## Extract data between "(" and ")".
    data = line[line.index("(")+1:line.index(")")]
    
    #% FACT: port(port_id, port_type, port_name, qualified_port_name, port_annotation_id, data_id).
    
    data = data.split(',')
    
    if data[1].strip().strip("'").upper().strip('"') == 'PARAM':
        port_type = 'IN'
    else:
        port_type = data[1].strip().strip("'").upper().strip('"')
    
    ins_query = [data[0].strip().strip("'"),port_type,data[2].strip().strip("'"),data[3].strip().strip("'")
                 ,data[4].strip().strip("'"),data[5].strip().strip("'")]
    conn.execute("""insert into port values(?,?,?,?,?,?)""", ins_query)
    conn.commit()
    return


### function extracting the input ports

def input_ports(line):
    #print("Extracting Input ports.")
    
    ## Extract data between "(" and ")".
    ## % FACT: has_in_port(step_id, port_id).

    data = line[line.index("(")+1:line.index(")")]
    
    data = data.split(',')
    ins_query = [data[0].strip().strip("'").strip('"'),data[1].strip().strip("'").strip('"')]
    conn.execute("""insert into has_in_port values(?,?)""", ins_query)
    conn.commit()
    
    #in_ports[data[0]].append((data[0].strip(), data[1].strip()))
    
    return

 ### function extracting the output ports 

def output_ports(line): 
    #print("Extracting output ports.")
    ## Extract data between "(" and ")".
    data = line[line.index("(")+1:line.index(")")]
    data = data.split(',')
    ins_query = [data[0].strip().strip("'").strip('"'),data[1].strip().strip("'").strip('"')]
    conn.execute("""insert into has_out_port values(?,?)""", ins_query)
    conn.commit()
    #out_ports[data[0]].append((data[0].strip(), data[1].strip()))
    #print(data)
    return

### function extracting the subprograms 

def has_subprogram(line): 
    #print("Extracting output ports.")
    ## Extract data between "(" and ")".
    data = line[line.index("(")+1:line.index(")")]
    data = data.split(',')
    
    ins_query = [data[0].strip().strip("'").strip('"'),data[1].strip().strip("'").strip('"')]
    conn.execute("""insert into has_subprogram values(?,?)""", ins_query)
    conn.commit()
    
    return

### function extracting the output ports 

def get_port_data(line): 
    #print("Extracting output ports.")
    ## Extract data between "(" and ")".
    data = line[line.index("(")+1:line.index(")")]
    data = data.split(',')
    
    ins_query = [data[0].strip().strip("'"),data[1].strip().strip("'"),data[2].strip().strip("'")]
    conn.execute("""insert into data values(?,?,?)""", ins_query)
    conn.commit()
    #print(data)
    return

### function extracting the output ports 

def get_port_connects_to_channel(line): 
     
    data = line[line.index("(")+1 : line.index(")")]
    data = data.split(',')

    ins_query = [data[0].strip().strip("'"),data[1].strip().strip("'")]
    conn.execute("""insert into port_connects_to_channel values(?,?)""", ins_query)
    conn.commit()
    
    return


def get_inflow_connections(line): 
     
    #print(line)
    data = line[line.index("(")+1:line.index(")")]
    data = data.split(',')
    #inflow_conn[data[0]]= data[1].strip()
    
    ins_query = [data[0].strip().strip("'").strip('"'),data[1].strip().strip("'").strip('"')]
    conn.execute("""insert into inflow_connects_to_channel values(?,?)""", ins_query)
    conn.commit()
    
    return

def get_outflow_connections(line): 
    #print("Extracting output ports.")
    ## Extract data between "(" and ")".
    data = line[line.index("(")+1:line.index(")")]
    data = data.split(',')
    #outflow_conn[data[0]]= data[1].strip()

    ins_query = [data[0].strip().strip("'").strip('"'),data[1].strip().strip("'").strip('"')]
    conn.execute("""insert into outflow_connects_to_channel values(?,?)""", ins_query)
    conn.commit()
    return

### function extracting the output ports 

def get_channel(line): 
    #print("Extracting output ports.")
    ## Extract data between "(" and ")".
    data = line[line.index("(")+1:line.index(")")]
    data = data.split(',')
    
    ins_query = [data[0].strip().strip("'").strip('"'),data[1].strip().strip("'").strip('"')]
    conn.execute("""insert into channel values(?,?)""", ins_query)
    conn.commit()
    #channel[data[0]]= data[1].strip()
    #print(data)
    return

def port_alias(line):
    data = line[line.index("(")+1:line.index(")")]
    data = data.split(',')
    
    port_id = data[0].strip()
    alias = data[1].strip().strip("'")

    ins_query = [data[0].strip().strip("'").strip('"'),data[1].strip().strip("'").strip('"')]
    conn.execute("""insert into port_alias values(?,?)""", ins_query)
    conn.commit()

    return

def read_yw_model(filename):
    regex = re.compile(r'^%')
    chk_channel = re.compile(r'^ch')
    with open(filename, "r") as yw_struct:
        line = yw_struct.readline()
        while line:
            #print(line)
            comments = regex.match(line)
            if comments: 
                #print(line)
                line = yw_struct.readline()
            else:  
                if("program(" in line and "has_subprogram" not in line):
                    extract_steps(line)
                elif("workflow(" in line):
                    extract_workflows(line)            
                elif("has_subprogram(" in line):
                    has_subprogram(line)            
                elif("port(" in line  and "has_in_port(" not in line and "has_out_port" not in line):
                #    print(line)
                    extract_ports(line)
                elif("has_in_port(" in line):
                    input_ports(line)
                elif("has_out_port(" in line ):
                    output_ports(line)
                elif ("port_alias(" in line ): 
                    port_alias(line)
                elif("data(" in line):
                    get_port_data(line)
                elif("port_connects_to_channel(" in line):
                    #print(line)
                    get_port_connects_to_channel(line)
                elif("inflow_connects_to_channel("in line):
                    #print(line)
                    get_inflow_connections(line)                    
                elif("outflow_connects_to_channel("in line):
                    get_outflow_connections(line)
                elif( chk_channel.match(line) ):
                    get_channel(line)

                line = yw_struct.readline()


def create_workflow_tables(conn):
	## Create tables for storing the data model. 
	# % FACT: program(program_id, program_name, qualified_program_name, begin_annotation_id, end_annotation_id).
	conn.execute("""create table steps (
	                program_id      int     primary key not NULL ,
	                program_name      text,
	                qualified_program_name  text)
	            """)

	#% FACT: workflow(program_id).

	conn.execute("""create table workflow (
	                program_id      int
	                )
	            """)

	#% FACT: has_subprogram(program_id, subprogram_id).

	conn.execute("""create table has_subprogram (
	                program_id  int,
	                sub_program_id      int
	                )
	            """)

	#% FACT: port(port_id, port_type, port_name, qualified_port_name, port_annotation_id, data_id).


	conn.execute("""create table port (
	                port_id      int     primary key not NULL,
	                port_type  int,
	                port_name  text,
	                qualified_port_name text,
	                port_annotation_id int, 
	                data_id int 
	                )
	            """)



	# % FACT: port_alias(port_id, alias).

	conn.execute("""create table port_alias (
	                port_id    int  ,
	                alias    text
	                )
	            """)

	#% FACT: has_in_port(block_id, port_id).

	conn.execute("""create table has_in_port (
	                block_id int,
	                port_id    int
	                )
	            """)

	#% FACT: has_out_port(block_id, port_id).

	conn.execute("""create table has_out_port (
	                block_id int,
	                port_id    int
	                )
	            """)

	#% FACT: data(data_id, data_name, qualified_data_name).

	conn.execute("""create table data (
	                data_id int,
	                data_name    text,
	                qualified_data_name text
	                )
	            """)

	#% FACT: channel(channel_id, data_id).


	conn.execute("""create table channel (
	                channel_id int,
	                data_id    int
	                )
	            """)

	#% FACT: port_connects_to_channel(port_id, channel_id).

	conn.execute("""create table port_connects_to_channel (
	                port_id int,
	                channel_id    int
	                )
	            """)
	    
	# % FACT: inflow_connects_to_channel(port_id, channel_id).
	conn.execute("""create table inflow_connects_to_channel (
	                port_id int,
	                channel_id    int
	                )
	            """)


	#% FACT: outflow_connects_to_channel(port_id, channel_id).
	conn.execute("""create table outflow_connects_to_channel (
	                port_id int,
	                channel_id    int
	                )
	            """)

def drop_workflow_tables():

	conn.commit()
	conn.execute (''' drop table if exists channel ''')                    
	conn.execute (''' drop table if exists data  ''')                 
	conn.execute (''' drop table if exists has_in_port ''')                  
	conn.execute (''' drop table if exists has_out_port ''')                
	conn.execute (''' drop table if exists has_subprogram ''')              
	conn.execute (''' drop table if exists inflow_connects_to_channel ''')  
	conn.execute (''' drop table if exists outflow_connects_to_channel ''')
	conn.execute (''' drop table if exists port ''')
	conn.execute (''' drop table if exists port_alias ''')
	conn.execute (''' drop table if exists port_connects_to_channel ''')
	conn.execute (''' drop table if exists steps ''')
	conn.execute (''' drop table if exists workflow ''')
	conn.execute (''' drop table if exists cwl_steps_info ''')
	conn.execute (''' drop table if exists wf_ports ''')
	conn.execute (''' drop table if exists qual_portname ''')
	conn.commit()
	return 

def create_DataFrames(reload): 
	print(reload)
	sql_steps_in_out_ports = '''
	select 
		wf.wf_id as workflow_id , s.program_id as program_id, s.program_name as program_name,
		p.port_name as port_name, p.qualified_port_name as qname, p.port_id as port_id, p.port_type as port_type , p.data_id as data_id   
	from 
		steps s, port p, has_in_port inp, 
		(select 
			sub_program_id  , program_id as wf_id 
		 from 
			has_subprogram
		) wf
	where 
		s.program_id = inp.block_id
	and	p.port_id = inp.port_id 
	and inp.block_id  = wf.sub_program_id
	union 
	select 
		wf.wf_id as workflow_id , s.program_id as program_id, s.program_name as program_name,
		p.port_name as port_name,p.qualified_port_name as qname, p.port_id as port_id, p.port_type as port_type , p.data_id as data_id 
	from 
		steps s, port p, has_out_port out,
		(select 
			sub_program_id  , program_id as wf_id 
		 from 
			has_subprogram
		) wf
	where 
		s.program_id = out.block_id
	and	p.port_id = out.port_id 
	and out.block_id = wf.sub_program_id
	'''


	sql_wf_ports = '''
	select 
		s.program_id, s.program_name, p.port_name, p.port_id, p.port_type, p.data_id  
	from 
		steps s, port p, has_in_port inp 
	where 
		s.program_id = inp.block_id
	and	p.port_id = inp.port_id 
	and inp.block_id in 
		(select 
			program_id  
		 from 
			workflow
		)
	union 
	select 
		s.program_id, s.program_name, p.port_name,p.port_id, p.port_type , p.data_id
	from 
		steps s, port p, has_out_port out 
	where 
		s.program_id = out.block_id
	and	p.port_id = out.port_id 
	and out.block_id in 
		(select 
			program_id  
		 from 
			workflow
		)
	'''

	sql_qual_portname = '''
	select 
		distinct p.program_id as workflow_id,  p.port_id,  p.program_name, p.port_name ,p.port_name as qualified_portname, p.port_type , p.data_id
	from
		wf_ports p, inflow_connects_to_channel q
	 where upper(p.port_type) in ('IN')
	 and p.port_id = q.port_id
	union 
	select
		p.workflow_id, p.port_id, p.program_name, p.port_name, p.program_name || '/' || p.port_name as qualified_portname, p.port_type , p.data_id
	from
		cwl_steps_info p
	where upper(p.port_type)= 'OUT'
	union
	select
		p.program_id as workflow_id, p.port_id, p.program_name, p.port_name, p.port_name as qualified_portname, p.port_type , p.data_id
	from
		wf_ports p, port po
	where p.port_id = po.port_id 
	and upper(po.port_name) like '_YW_IN%'	
	'''

	sql_wf_qual_out_port = '''
	select 
		p.program_name, q.port_name, p.program_name || '/' || p.port_name as qualified_portname, p.port_type , p.data_id
	from 
		cwl_steps_info p , port q
	where q.port_id = p.port_id
	and p.port_id in 
		(
		select 
			port_id
		from 
			port_connects_to_channel
		where 
			channel_id in 
			(select 
				max(channel_id)
			from 
				outflow_connects_to_channel
			group by port_id
			)
		)
	union 
	select 
		p.program_name, pa.alias as port_name, p.program_name || '/' || p.port_name as qualified_portname, p.port_type , p.data_id
	from 
		cwl_steps_info p , port q, port_alias pa
	where q.port_id = p.port_id
	and p.port_id = pa.port_id
	and p.port_id in 
		(
		select 
			port_id
		from 
			port_connects_to_channel
		where 
			channel_id in 
			(select 
				max(channel_id)
			from 
				outflow_connects_to_channel
			group by port_id
			)
		)
	union
	select 
		p.qualified_port_name, p.port_name,  p.qualified_port_name, p.port_type , p.data_id
	from 
		port p 
	where p.port_name like '_YW_OUT%'
	'''

	sql_dangling_port_id = """
	select 
		port_id 
	from
		port 
	where data_id in 
	(
		select distinct data_id from port  
		EXCEPT
		select distinct data_id  from channel
	)
	"""

	sql_port_alias = '''
	select 
	    port_id, alias
	from 
	    port_alias
	 '''


	sql_multiwriter_port = '''
	select 
		cwf.workflow_id as workflow_id , cwf.program_id as program_id, cwf.program_name as program_name,cwf.port_name as port_name, cwf.port_id as port_id, cwf.port_type as port_type , cwf.data_id as data_id 
	from 
		cwl_steps_info cwf
	where port_type = 'OUT'
	and cwf.data_id in 
		(
		select 
			data_id
		from 
			cwl_steps_info
		where port_type ='OUT'
		group by data_id
		having count(1) > 1
		)
	'''
	sql_data = """
	select 
	    * 
	from 
	    data
	"""

	
	if reload:
		conn.execute (''' drop table if exists cwl_steps_info ''')
		conn.execute (''' drop table if exists wf_ports ''')
		conn.execute (''' drop table if exists qual_portname ''')
		
		conn.execute('create table cwl_steps_info as ' + sql_steps_in_out_ports)
		conn.execute('create table wf_ports as ' + sql_wf_ports)
		conn.execute('create table qual_portname as ' + sql_qual_portname)

		cwl_file_df = pd.read_sql_query(sql_steps_in_out_ports, con=conn)
		wf_port_df = pd.read_sql_query(sql_wf_ports, con=conn)
		df_dangling_ports = pd.read_sql_query(sql_dangling_port_id, con=conn)
		df_port_alias = pd.read_sql_query(sql_port_alias, con=conn)
		qual_portname = pd.read_sql_query(sql_qual_portname, con=conn)
		qual_wf_out_port = pd.read_sql_query(sql_wf_qual_out_port, con=conn)
		df_multiwriter_port= pd.read_sql_query(sql_multiwriter_port, con=conn)
		df_data= pd.read_sql_query(sql_data, con=conn)

		df_tuple = (cwl_file_df, wf_port_df, df_dangling_ports, df_port_alias, qual_portname ,qual_wf_out_port,df_multiwriter_port,df_data)
	else:
		conn.execute('create table cwl_steps_info as ' + sql_steps_in_out_ports)
		cwl_file_df = pd.read_sql_query(sql_steps_in_out_ports, con=conn)
		wf_port_df = pd.read_sql_query(sql_wf_ports, con=conn)
		df_dangling_ports = pd.read_sql_query(sql_dangling_port_id, con=conn)
		df_port_alias = pd.read_sql_query(sql_port_alias, con=conn)
		df_multiwriter_port= pd.read_sql_query(sql_multiwriter_port, con=conn)
		df_data= pd.read_sql_query(sql_data, con=conn)
		
		df_tuple = (cwl_file_df, wf_port_df, df_dangling_ports, df_port_alias,df_multiwriter_port,df_data)

	return df_tuple

## Add an input port in the ports tables
def ins_in_port(program_name):
	wf_id = cwl_file_df[cwl_file_df['program_name'] == program_name]['workflow_id'].values[0]
	prog_id = cwl_file_df[cwl_file_df['program_name'] == program_name]['program_id'].values[0]
	port_id = cwl_file_df['port_id'].max() + 1
	data_id = cwl_file_df['data_id'].max() + 1
	#print(port_id, data_id)
	port_type = 'IN'
	port_name = '_YW_IN_'+ program_name
	qual_prog_name = program_name + '/' + port_name
	sql = """
	insert into port values (?,?,?,?,?,?)
	"""
	data = [int(port_id), port_type, port_name,port_name,port_id,int(data_id)]
	conn.execute(sql,data)

	sql = """
	insert into has_in_port values (?,?)
	"""
	data = [int(wf_id),int(port_id)]
	#print(data)
	conn.execute(sql,data)
	data = [int(prog_id),int(port_id)]
	#print(data)    
	conn.execute(sql,data)
	conn.commit()





## Add an output port in the ports tables
def ins_out_port(program_name):
    wf_id = cwl_file_df[cwl_file_df['program_name'] == program_name]['workflow_id'].values[0]
    prog_id = cwl_file_df[cwl_file_df['program_name'] == program_name]['program_id'].values[0]
    port_id = cwl_file_df['port_id'].max() + 1
    data_id = cwl_file_df['data_id'].max() + 1
    #print(port_id, data_id)
    port_type = 'OUT'
    port_name = '_YW_OUT_'+ program_name
    qual_prog_name = program_name + '/' + port_name
    sql = """
    insert into port values (?,?,?,?,?,?)
    """
    data = [int(port_id), port_type, port_name,qual_prog_name,port_id,int(data_id)]
    conn.execute(sql,data)
    
    sql = """
    insert into has_out_port values (?,?)
    """
    data = [int(wf_id),int(port_id)]
    conn.execute(sql,data)
    data = [int(prog_id),int(port_id)]
    conn.execute(sql,data)
    conn.commit()


## Add an input/output dangliging port in the ports tables
def ins_link_wf_port(port_id, wf_id,port_type,program_name):
    #print(port_id, data_id)
    new_port_id = get_max_port_id() + 1
    data_id = cwl_file_df[cwl_file_df['port_id'] == port_id]['data_id']
    #print(type(new_port_id))
    
    port_name = cwl_file_df[cwl_file_df['port_id'] == port_id]['port_name'].values[0]
    
    print(port_name)
    if port_type == 'OUT':
        wf_port_name = '_YW_OUT_'+ port_name
        qual_prog_name = program_name + '/' + port_name
        sql_link = """
                   insert into has_out_port values (?,?)
                   """
        values = [int(wf_id),int(new_port_id)]
    else: 
        wf_port_name = '_YW_IN_'+ port_name
        qual_prog_name =  wf_port_name
        sql_link = """
                   insert into has_in_port values (?,?)
                   """   
        values = [int(wf_id),int(new_port_id)]
        
    #print(qual_prog_name)
    sql = """
    insert into port values (?,?,?,?,?,?)
    """
    
    data = [int(new_port_id), port_type, wf_port_name,qual_prog_name,port_id,int(data_id)]
    conn.execute(sql,data)
    #print(data)
    #print(values)
    conn.execute(sql_link,values)
    conn.commit()


"""
	Get the max port id from the port table.
"""    
def get_max_port_id():
    cur = conn.cursor()
    cur.execute('''SELECT max(port_id) from port ''')
    max_port_id = cur.fetchone()
    
    return int(max_port_id[0])


'''
'''

def check_danglingports():
	## Get the list of the dangling port id's and pass into the DF. 
	for idx in cwl_file_df[cwl_file_df['port_id'].isin(df_dangling_ports['port_id'])].index:
	    wf_id = cwl_file_df.loc[idx]['workflow_id']
	    port_id = cwl_file_df.loc[idx]['port_id']
	    port_name = cwl_file_df.loc[idx]['port_name']
	    port_type = cwl_file_df.loc[idx]['port_type']
	    program_name = cwl_file_df.loc[idx]['program_name']
	    #print(port_name)
	    ins_link_wf_port(port_id, wf_id,port_type,program_name)


def print_footer():
	print("Process Completed.")
	print("+" * 100)
	print("\n")

### Check for the programs without output ports
### use the ins_out_port to create the output port for wf and prog. 
def chk_prog_wo_output_port():
	program_name_uniq = cwl_file_df['program_name'].unique()
	program_with_out  = cwl_file_df[cwl_file_df['port_type'] == 'OUT']["program_name"].unique()
	prog_wo_outport = list(set(program_name_uniq).difference(set(program_with_out)))

	for prog in prog_wo_outport:
	    print(prog)
	    ins_out_port(prog)

### Check for the programs without output ports
### use the ins_in_port to create the output port for wf and prog. 
def chk_prog_wo_input_port():
	program_name_uniq = cwl_file_df['program_name'].unique()
	program_with_in  = cwl_file_df[cwl_file_df['port_type'] == 'IN']["program_name"].unique()
	prog_wo_inport  =list(set(program_name_uniq).difference(set(program_with_in)))
	
	for prog in prog_wo_inport:
	    print(prog)
	    ins_in_port(prog)

def reload_dataframe():
### Reload the dataframes now 

	df_tuple = create_DataFrames(True)
	return df_tuple

def get_filename(program_id, is_wf):
    wfid_list = wf_port_df['program_id'].unique()
    if is_wf:
        program_name =wf_port_df[wf_port_df['program_id'] ==program_id]['program_name'].values[0]
        return 'wf_' + program_name + '.cwl'
    elif program_id in wfid_list:      
        program_name = cwl_file_df[cwl_file_df['program_id'] ==program_id]['program_name'].values[0]
        return 'wf_' + program_name + '.cwl'
    else:
        program_name = cwl_file_df[cwl_file_df['program_id'] ==program_id]['program_name'].values[0]
        return program_name + '.cwl'

def write_cwl_file(filename, header, input_params, output_params):
    #print(filename)
    with open(filename,'w+') as writer: 
        writer.write(header)
        writer.write(input_params)
        writer.write(output_params)

def get_wf_steps(workflow_id):
    header_step = "steps: \n "
    buffer=''
    prog_list = cwl_file_df[cwl_file_df['workflow_id'] == workflow_id]['program_id'].unique()
    
    for prog in prog_list: 
        outport_list= []
        prog_name = cwl_file_df[cwl_file_df['program_id'] ==prog]['program_name'].values[0]
        filename = get_filename(prog,False)
        


        buffer = buffer + prog_name + ': \n ' + ' run: ' +filename + ' \n ' + ' in: \n'
        
        for pid in cwl_file_df[cwl_file_df["program_id"]==prog].index:
            
            port_id = cwl_file_df.loc[pid]['port_id'] 
            port_name = cwl_file_df.loc[pid]['port_name'] 
            port_type = cwl_file_df.loc[pid]['port_type']       
            data_id = cwl_file_df.loc[pid]['data_id']
            
            if port_type == 'IN':
                
                filtered_df =  qual_portname[qual_portname["workflow_id"] == workflow_id]
                qn_df = filtered_df[filtered_df["data_id"] == data_id]["qualified_portname"]
                
                if len(qn_df) == 0 :
                    alias = df_port_alias[df_port_alias["port_id"]==port_id]['alias']
                    wf_in_port = wf_port_df[wf_port_df["port_name"] ==port_name].values[0] 
                    if len(wf_in_port) != 0:
                        qname = port_name                   
                    elif len(alias) != 0 :
                        qname = alias.values[0]
                    else:
                        qname = port_name
                else: 
                    if '_YW_IN_' in port_name:
                        qname = cwl_file_df.loc[pid]['qname']
                    else:
                        qname = qn_df.values[0]
                buffer = buffer + '   ' + port_name + ': ' + qname + '\n'
            else: 
                outport_list.append(port_name)
            #break
        buffer = buffer + "  out: [" + ','.join(outport_list) + '] \n '  

    return header_step + buffer


def create_cwl_file(): 
	for prog_id in prog_list: 
		cwl_file_header = '#!/usr/bin/env cwl-runner \n'
		cwl_file_header = cwl_file_header  + 'cwlVersion: v1.0 \n'
		cwl_file_header = cwl_file_header  + 'class: CommandLineTool \n'
		input_buffer = 'inputs: \n'
		output_buffer = 'outputs: \n'
		pname = cwl_file_df[cwl_file_df["program_id"] == [prog_id]]['program_name'].values[0]
	    #print(prog_id)
		filename = dirname + '/' + get_filename(prog_id, False)

		print(filename)
		for p_idx in cwl_file_df[cwl_file_df["program_id"] == [prog_id]].index:
		#pname = cwl_file_df.loc[p_idx]['program_name']
			pid = cwl_file_df.loc[p_idx]['program_id']
			#print(pname)
			port_name = cwl_file_df.loc[p_idx]['port_name'] 
			port_type = cwl_file_df.loc[p_idx]['port_type'] 
			#print(port_name, port_type)

			if port_type == 'IN':
				input_buffer = input_buffer + ' '+ port_name + ': \n'+ '  type: string \n \n'
			#print(input_buffer)
			else: 
				output_buffer = output_buffer + ' '+ port_name + ': \n'+ '  type: string \n \n'
			#print(output_buffer)
	    
		output_buffer = output_buffer + "baseCommand: "
		write_cwl_file(filename, cwl_file_header, input_buffer, output_buffer)

def create_cwl_workflow():
	cwl_wf_header = '#!/usr/bin/env cwl-runner \n'
	cwl_wf_header = cwl_wf_header  + 'cwlVersion: v1.0 \n' 
	cwl_wf_header = cwl_wf_header  + 'class: Workflow \n'
	cwl_wf_header = cwl_wf_header  + 'requirements: \n'
	cwl_wf_header = cwl_wf_header  + '  - class: SubworkflowFeatureRequirement \n'

	workflow_list = wf_port_df['program_id'].unique()

	for id in sorted(workflow_list, reverse=True):
		input_buffer = 'inputs: \n'
		output_buffer = 'outputs: \n'
		#print(id)
		wf_name = wf_port_df[wf_port_df['program_id']== id]["program_name"].values[0]
		filename= dirname +'/' + get_filename(id, True)
		print(filename)
		for p_id in wf_port_df[wf_port_df['program_id']== id].index:
			prog_id = wf_port_df.loc[p_id]['program_id']
		    #print(int(prog_id))


			pname = wf_port_df.loc[p_id]['program_name']
			port_name = wf_port_df.loc[p_id]['port_name'] 
			port_type = wf_port_df.loc[p_id]['port_type'] 


			if port_type == 'IN':
				input_buffer = input_buffer + ' '+ port_name + ': \n'+ '  type: string \n \n'
			#print(input_buffer)
			else: 
				qname = qual_wf_out_port[qual_wf_out_port['port_name'] == port_name]['qualified_portname'].values[0]
				output_buffer = output_buffer + '  ' +  port_name  + ': \n' + '   type: string \n   outputSource: '+ qname +'\n'
			#print(output_buffer)
	    
		wf_step_contents = get_wf_steps(id)
		write_cwl_file(filename,cwl_wf_header + input_buffer, output_buffer, wf_step_contents)


def get_max_prog_id():
    cur = conn.cursor()
    cur.execute('''SELECT max(program_id) as max_program_id from steps ''')
    max_program_id = cur.fetchone()
    
    return int(max_program_id[0])

def get_max_outport_channel_id(port_id):
    cur = conn.cursor()
    cur.execute(''' select 
			max(channel_id)
		from 
			outflow_connects_to_channel
        where port_id = :port_id
		group by port_id
        ''', {'port_id':port_id})
    max_channel_id = cur.fetchone()
    
    return int(max_channel_id[0])   

## Add an output port in the ports tables
def ins_yw_program(wf_id, data_id,multiport_id, multi_port_name):
    prog_id = get_max_prog_id() + 1
    yw_prog_name = '_YW_PROG_' + str(prog_id )
    
    sql_prog = """
               insert into steps values(?,?,?) 
               """

    #print([prog_id, yw_prog_name, yw_prog_name])
    
    sql_inprog = """
                 insert into has_subprogram values(?,?)
                 """   
    values = [int(wf_id), prog_id]
    #print(values)
    conn.execute(sql_prog,[prog_id, yw_prog_name, yw_prog_name])
    conn.commit()
    conn.execute(sql_inprog,values)
    conn.commit()
    
    port_type = 'OUT'
    new_port_id = get_max_port_id() +1 
    wf_port_name = '_YW_OUT' + yw_prog_name
    
    sql_port = """
               insert into port values (?,?,?,?,?,?)
               """ 
    data = [int(new_port_id), port_type, wf_port_name,yw_prog_name + '/'+ wf_port_name,new_port_id,int(data_id)]
    
    conn.execute(sql_port,data)
    conn.commit()

    sql_link = """
               insert into has_out_port values (?,?)
               """   
    values = [int(prog_id),int(new_port_id)]
    #print(values)
    
    conn.execute(sql_link,values)
    conn.commit()       
    
    channel_id = get_max_outport_channel_id(int(multiport_id))
    sql_upd = """
              update port_connects_to_channel set port_id = :port_id where channel_id =:channel_id
              """
    conn.execute(sql_upd,  {"channel_id": channel_id, "port_id":new_port_id})
    conn.commit()
    
    sql_link = """
               insert into port_alias values (?,?)
               """   
    values = [int(new_port_id),multi_port_name]
    conn.execute(sql_link,values)
    conn.commit()       
    
    return prog_id

## Add an output port in the ports tables
def ins_yw_prog_ports(new_program_id, port_id,port_name, qual_prog_name, data_id):
    
    port_type = 'IN'
    new_port_id = get_max_port_id() +1 
    wf_port_name = '_YW_IN_' + port_name + '_' + str(new_port_id)
    
    sql_port = """
               insert into port values (?,?,?,?,?,?)
               """ 
    data = [int(new_port_id), port_type, wf_port_name,qual_prog_name,port_id,int(data_id)]
    
    conn.execute(sql_port,data)
    conn.commit()

    sql_link = """
               insert into has_in_port values (?,?)
               """   
    values = [int(new_program_id),int(new_port_id)]
    print(values)
    
    conn.execute(sql_link,values)
    conn.commit()
    
    #rebuild_dataframes()



def check_multiwriter_prog():
	if df_multiwriter_port.shape[0] > 1: 
		wf_id = df_multiwriter_port['workflow_id'].values[0]
		data_id = df_multiwriter_port['data_id'].values[0]
		multiport_name = df_data[df_data['data_id' ]== data_id]['data_name'].unique()[0]
		multiport_id = wf_port_df[wf_port_df['port_name'] ==multiport_name]["port_id"].values[0]
		wf_data_id = wf_port_df[wf_port_df['port_name'] == multiport_name]['data_id'].values[0]
		print(data_id,multiport_name,multiport_id)
		new_prog_id = ins_yw_program(wf_id,wf_data_id,multiport_id,multiport_name)
		for idx in df_multiwriter_port.index:
			port_id = df_multiwriter_port.loc[idx]['port_id']
			port_name = df_multiwriter_port.loc[idx]['port_name']    
			port_type = df_multiwriter_port.loc[idx]['port_type']
			program_name = df_multiwriter_port.loc[idx]['program_name']
			data_id = df_multiwriter_port.loc[idx]['data_id']
			ins_yw_prog_ports(new_prog_id,port_id,port_name, program_name+'/'+port_name, data_id)
	else:
		print("There are no multiple writers for the same port.")







"""

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	MAIN FUNCTION FOR EXECUTION OF PARSER
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

"""        	
#@begin YW2CWL_parser 
#@in yw_model_file 
#@param base_dir 


#@begin create_db_conn 
#@in yw_model_file 
#@param base_dir 

base_dir = 'example_sql/'
input_file = input("Enter the yw model filename:  ")
yw_model_file = base_dir + input_file 
db_model = yw_model_file[:-2] + '.db'
print(db_model)
conn = sqlite3.connect(db_model)
#@out db_conn
#@end  create_db_conn

#@begin create_db_tables
#@in db_conn
drop_workflow_tables()
create_workflow_tables(conn);
#@out yw_tables
#@end create_db_tables 


#@begin create_yw_db_model 
#@in yw_model_file
#@param yw_tables
print("+" * 100)
print("Reading Model Files and creating tables in the database: " + db_model)
read_yw_model(yw_model_file)
print_footer()
#@out yw_db_model
#@end create_yw_db_model 


#@begin create_dataFrames 
#@in yw_tables
print("+" * 100)
print("Creating dataframes for processing. ")
cwl_file_df, wf_port_df, df_dangling_ports, df_port_alias, df_multiwriter_port ,df_data = create_DataFrames(False)
print_footer()
#@out dataFrames
#@end create_dataFrames

#@begin create_missing_cwl_ports
#@in dataFrames
print("+" * 100)
print("Check for the program without input ports and create the entries in the port and respective realtions. ")
chk_prog_wo_input_port()
print_footer()



print("+" * 100)
print("Check for the program without output ports and create the entries in the port and respective realtions. ")
chk_prog_wo_output_port()
print_footer()

print("+" * 100)
print("Check for the dangling ports and create the entries in the port and respective realtions. ")
check_danglingports()
print_footer()

#@out yw_tables
#@end create_missing_cwl_ports


#@begin create_yw_program
#@in dataFrames
print("+" * 100)
print("Check for the output port written by multiple programs. ")
check_multiwriter_prog()
print_footer()
#@out yw_tables
#@end create_missing_cwl_ports



#@begin reload_dataFrames
#@in yw_tables 
print("+" * 100)
print("Reload the dataframes as data in tables have changed. ")
cwl_file_df, wf_port_df, df_dangling_ports, df_port_alias, qual_portname ,qual_wf_out_port, df_multiwriter_port ,df_data = reload_dataframe()
print(cwl_file_df.shape)
print_footer()

#@out dataFrames 
#@end reload_dataFrames 


#@begin create_cwl_file
#@in dataFrames
print("+" * 100)
print("create list of workflow_id and program_id")
wf_id = cwl_file_df['workflow_id'].unique()
prog_list = cwl_file_df['program_id'].unique()
print(wf_port_df)
dirname = base_dir +  wf_port_df[wf_port_df["program_id"] ==1]['program_name'].values[0]
print ("Directory for storing the output files. " + dirname)
print_footer()
print("+" * 100)
print("creating cwl files required for creating the worflows.")

create_cwl_file()
print_footer()
#@out cwl_files
#@end create_cwl_file

#@begin create_cwl_wf
#@in dataFrames 
#@in cwl_files 

print("+" * 100)
print("creating cwl workflow files ")

create_cwl_workflow()
print_footer()

#@out cwl_wf_files 
#@end create_cwl_wf 


#@out yw_db_model
#@out cwl_wf_files


#@end YW2CWL_parser