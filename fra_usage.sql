---script to show fra usage
-- Michael Muehlbeyer 16/05/2019

set lines 300
alter session set nls_date_format='DD.MON.YYYY HH24:MI:SS';

--general infos
col name for a30
select
name, 
space_limit/1024/1024 as "max (MB)",
space_used/1024/1024 as "used (MB)", 
space_reclaimable/1024/1024 as "reusable (MB)",
number_of_files
from  v$recovery_file_dest;

--details about occupants
select
file_type,
percent_space_used,
percent_space_reclaimable,
number_of_files
from v$flash_recovery_area_usage;
