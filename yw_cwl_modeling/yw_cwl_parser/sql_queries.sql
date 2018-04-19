drop table channel ;                   
drop table data ;                 
drop table has_in_port ;                  
drop table has_out_port ;               
drop table has_subprogram ;              
drop table inflow_connects_to_channel ;  
drop table outflow_connects_to_channel ;
drop table port ;
drop table port_aliax ;
drop table port_connects_to_channel ;
drop table steps ;
drop table workflow ;
drop table cwl_steps_info ;
drop table wf_ports ;


create table cwl_steps_info as 
select 
	wf.wf_id, s.program_id, s.program_name, p.port_name, p.port_id, p.port_type, p.data_id  
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
	wf.wf_id, s.program_id, s.program_name, p.port_name,p.port_id, p.port_type , p.data_id
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

; 

###  table for the wf ports 

create table wf_ports as 
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
;

### table for programs with qualified portname 

create table qual_portname as 
select 
	p.program_name, p.port_name , q.port_name as qualified_portname, p.port_type , p.data_id
from
	cwl_steps_info p, wf_ports q
 where upper(p.port_type) in ('IN', 'PARAM')
 and p.port_name = q.port_name
 union
select 
	p.program_name, p.port_name , q.port_name as qualified_portname, p.port_type, p.data_id
from
	cwl_steps_info p, wf_ports q, port_alias pa
 where upper(p.port_type) in ('IN', 'PARAM') 
 and p.port_id = pa.port_id
 and pa.alias = q.port_name
union 
select
	p.program_name, p.port_name, p.program_name || '/' || p.port_name as qualified_portname, p.port_type , p.data_id
from
	cwl_steps_info p
where upper(p.port_type)= 'OUT'
;


### Qualified WF output ports ### 
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
	p.qualified_port_name, p.port_name,  p.port_name as qualified_portname, p.port_type , p.data_id
from 
	port p 
where p.port_name like '_YW_%'
;

### Select dangling ports which are not linked to global input or output 
### and are not part of as input or output
### basically they are not connected to any channels.

select 
	port_name ## , port_id, data_id
from
	port 
where data_id in 
(
	select distinct data_id from port  
	EXCEPT
	select distinct data_id  from channel
)


	EXCEPT
	select distinct data_id from qual_portname where port_type = 'OUT'
	EXCEPT
	select distinct data_id from wf_ports where port_type = 'IN'