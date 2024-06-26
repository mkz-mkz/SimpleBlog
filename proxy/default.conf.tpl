server {
    listen 80;

    location /static/ {
        alias /app/static/;
    }

    location /media/ {
        alias /app/media/;
    }

    location / {
        proxy_pass http://${APP_HOST}:${APP_PORT};
        include    /etc/nginx/proxy_params;
    }

}