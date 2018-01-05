#
#	SQL Operations Studio
#
#
# https://docs.microsoft.com/en-us/sql/sql-operations-studio/download#get-sql-operations-studio-preview-for-linux
#
# 1. Pull the pre-requisites
#
sudo apt-get install libxss1
sudo apt-get install libgconf-2-4
sudo apt-get install libunwind8

#
#
#
cd ~
cp ~/Downloads/sqlops-linux-<version string>.tar.gz ~
tar -xvf ~/sqlops-linux-<version string>.tar.gz
echo 'export PATH="$PATH:~/sqlops-linux-x64"' >> ~/.bashrc
source ~/.bashrc
sqlops
