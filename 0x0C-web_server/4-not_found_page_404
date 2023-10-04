#!/usr/bin/env bash
# Install and setup new nginx server

apt-get update -y && \
apt-get install -y nginx
if [ $? -eq 0 ]
then
    service nginx start
    echo -e \
"http {
    root /var/www/holberton;
    server {
        listen 80;
        server_name pearmountain.space;
        error_page 404 /404_file_not_found.html;
        rewrite ^/redirect_me$ \
https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
        location / {
            index index.html;
        }
        location /404_file_not_found.html {
            internal;
        }
    }
}
events {
}" > /etc/nginx/nginx.conf
    mkdir -p /var/www/holberton
    echo "Holberton School" > \
	/var/www/holberton/index.html
    echo "Ceci n'est pas une page" > \
	/var/www/holberton/404_file_not_found.html
    nginx -s reload
else
    echo "Could not install nginx"
    exit 1
fi
exit 0
