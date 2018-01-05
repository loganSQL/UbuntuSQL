#
# https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker
#
# pull mssql docker image
sudo docker pull microsoft/mssql-server-linux:2017-latest
# run the image and build the container
sudo docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=meltdown2018' \
   -p 1401:1433 --name sql1 \
   -d microsoft/mssql-server-linux:2017-latest
# container is built but not started
sudo docker ps -a
# start the container
docker start sql1
# container is up and running
sudo docker ps
#
# connect to container and start bash shell
sudo docker exec -it sql1 "bash"
# inside the container, connect to sql instance using localhost
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA
# confirm the instance name and version
select @@servername, @@version
# ... you can create your db and DML
#
#
# Connect from outside the container
#
# container ip
docker inspect sql1|grep "IPAddress"
# linux host ip
ifconfig | grep "inet address"
#
sqlcmd -S yourip:1401 -Usa
#
# Housekeep
#
sudo docker stop sql1
sudo docker rm sql1

