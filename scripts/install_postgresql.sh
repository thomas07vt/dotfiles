# Source:
#https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-14-04
#
sudo apt-get update;
sudo apt-get install postgresql postgresql-contrib libpq-dev;

echo "postgresql installed, postgres user created";

echo "Create pguser: sudo -u postgres createuser -s pguser"
echo "Set password for db user: sudo -u postgres psql"
echo "Set password pgcommand: \password pguser"
echo "Create database pgcommand: CREATE DATABASE dbname OWNER rolename; (appname should be lowecase, example: CREATE DATABASE 'railsapp' OWNER 'pguser';)"

echo "log into postgres user: sudo -i -u postgres ";
echo "get postgres prompt: psql"
echo "exit postgres prompt: \q"

