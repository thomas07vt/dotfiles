
# INSTALL NGINX through Apt-get
##############################
echo "Create deploy user first!!!"
# sudo adduser deploy
# sudo gpasswd -a deploy sudo
#
sudo apt-get update;
sudo apt-get install curl git-core nginx -y;

echo "Link App level nginx.conf to Nginx:"
echo "-----------------------------------"
echo "sudo rm /etc/nginx/sites-enabled/default"
echo "sudo ln -nfs '/home/deploy/apps/<appname>/current/config/nginx.conf' '/etc/nginx/sites-enabled/<appname>'"

