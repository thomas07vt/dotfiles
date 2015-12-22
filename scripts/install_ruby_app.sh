# source: https://www.digitalocean.com/community/tutorials/deploying-a-rails-app-on-ubuntu-14-04-with-capistrano-nginx-and-puma
#
#
# First Time cap:
# cap production deploy:initial
#
#Set up NGINX conf:
#sudo rm /etc/nginx/sites-enabled/default
#sudo ln -nfs "/home/deploy/apps/appname/current/config/nginx.conf" "/etc/nginx/sites-enabled/appname"
#sudo service nginx restart

# Normal deployments:
#git add -A
#git commit -m "Deploy Message"
#git push origin master
#cap production deploy

