---script to estimate time until completion of RMAN task
-- useful for restore/backup estimation
-- Michael Muehlbeyer 16/03/2019

set lines 200
col opname for a30
col pct_done for a8
alter session set nls_date_format='DD.MON.YYYY HH24:MI:SS';
select sl.sid, sl.opname,
       to_char(100*(sofar/totalwork), '990.9')||'%' pct_done,
       sysdate+(time_remaining/60/60/24) done_by
  from v$session_longops sl, v$session s
 where sl.sid = s.sid
   and sl.serial# = s.serial#
   and sl.sid in (select sid from v$session where module like 'backup%' or module like 'restore%' or module like 'rman%')
   and sofar != totalwork
        and totalwork > 0
/
