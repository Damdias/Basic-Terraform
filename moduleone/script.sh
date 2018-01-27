wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list)"
sudo apt-get update
sudo apt-get install -y mssql-server
sudo ACCEPT_EULA='Y' MSSQL_PID='Express' MSSQL_SA_PASSWORD='Damith123$' MSSQL_TCP_PORT=1433 /opt/mssql/bin/mssql-conf setup
systemctl status mssql-server