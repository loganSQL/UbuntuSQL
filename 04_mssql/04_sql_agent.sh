#
# https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-sql-agent#a-nameubuntuinstall-on-ubuntua
#
#
# install the mssql-server-agent on Ubuntu
#
sudo apt-get update 
sudo apt-get install mssql-server-agent
sudo systemctl restart mssql-server
# check status
systemctl status mssql-server
#
# The following T-SQL script
# 1) create a TestDB 
# 2) create a SQL Agent Job
# 3) start and test the Job
#
create database TestDB
GO
-- Adds a new job executed by the SQLServerAgent service
-- called 'Daily TestDB Backup'
USE msdb ;
GO
EXEC dbo.sp_add_job
   @job_name = N'Daily TestDB Backup' ;
GO
-- Adds a step (operation) to the job
EXEC sp_add_jobstep
   @job_name = N'Daily TestDB Backup',
   @step_name = N'Backup database',
   @subsystem = N'TSQL',
   @command = N'BACKUP DATABASE TestDB TO DISK = \
      N''/tmp/TestDB.bak'' WITH NOFORMAT, NOINIT, \
      NAME = ''TestDB-full'', SKIP, NOREWIND, NOUNLOAD, STATS = 10',
   @retry_attempts = 5,
   @retry_interval = 5 ;
GO
-- Creates a schedule called 'Daily'
EXEC dbo.sp_add_schedule
   @schedule_name = N'Daily TestDB',
   @freq_type = 4,
   @freq_interval = 1,
   @active_start_time = 233000 ;
USE msdb ;
GO
-- Sets the 'Daily' schedule to the 'Daily TestDB Backup' Job
EXEC sp_attach_schedule
   @job_name = N'Daily TestDB Backup',
   @schedule_name = N'Daily TestDB';
GO
EXEC dbo.sp_add_jobserver
   @job_name = N'Daily TestDB Backup',
   @server_name = N'(LOCAL)';
GO
-- start the job
EXEC dbo.sp_start_job N' Daily TestDB Backup' ;
GO
