#
# Configure SQL Server on Linux with the mssql-conf tool
#
# https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-configure-mssql-conf
#
# mssql-conf is a configuration script to set mssql server software parameters:
: <<'END'
Usage tips

1) For Always On Availability Groups and shared disk clusters, always make the same configuration changes on each node.

2) For the shared disk cluster scenario, do not attempt to restart the mssql-server service to apply changes. SQL Server is running as an application. Instead, take the resource offline and then back online.

3) These examples run mssql-conf by specify the full path: /opt/mssql/bin/mssql-conf. If you choose to navigate to that path instead, run mssql-conf in the context of the current directory: ./mssql-conf.
END

# 1. Set the memory limit
sudo /opt/mssql/bin/mssql-conf set memory.memorylimitmb 3328
sudo systemctl restart mssql-server

# 2. Change the TCP port
sudo /opt/mssql/bin/mssql-conf set network.tcpport <new_tcp_port>
sudo systemctl restart mssql-server
sqlcmd -S localhost,<new_tcp_port> -U test -P test

# 3. Specify TLS settings
# https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-encrypted-connections

# 4. Enable/Disable traceflags
sudo /opt/mssql/bin/mssql-conf traceflag 1234 on
sudo /opt/mssql/bin/mssql-conf traceflag 2345 3456 on
sudo /opt/mssql/bin/mssql-conf traceflag 1234 2345 3456 off
sudo systemctl restart mssql-server

# 5. Remove a setting
# clear TCP port
sudo /opt/mssql/bin/mssql-conf unset network.tcpport
sudo systemctl restart mssql-server

# 6. View current settings
sudo cat /var/opt/mssql/mssql.conf

[EULA]
accepteula = Y

[coredump]
captureminiandfull = true
coredumptype = full

[filelocation]
defaultbackupdir = /var/opt/mssql/data/
defaultdatadir = /var/opt/mssql/data/
defaultdumpdir = /var/opt/mssql/data/
defaultlogdir = /var/opt/mssql/data/

[hadr]
hadrenabled = 0

[language]
lcid = 1033

[memory]
memorylimitmb = 4096

[network]
forceencryption = 0
ipaddress = 10.192.0.0
kerberoskeytabfile = /var/opt/mssql/secrets/mssql.keytab
tcpport = 1401
tlscert = /etc/ssl/certs/mssql.pem
tlsciphers = ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA:ECDHE-RSA-AES128-SHA:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA
tlskey = /etc/ssl/private/mssql.key
tlsprotocols = 1.2,1.1,1.0

[sqlagent]
databasemailprofile = default
errorlogfile = /var/opt/mssql/log/sqlagentlog.log
errorlogginglevel = 7

[telemetry]
customerfeedback = true
userrequestedlocalauditdirectory = /tmp/audit

[traceflag]
traceflag0 = 1204
traceflag1 = 2345
traceflag = 3456
