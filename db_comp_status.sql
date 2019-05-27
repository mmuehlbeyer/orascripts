--script to show status for installed db components
-- Michael Muehlbeyer 27/05/2019

set pages 60
set lines 300

col comp_name for a44 hea 'component'
col version for a17
col status for a17

select comp_name, version, status from dba_registry;

