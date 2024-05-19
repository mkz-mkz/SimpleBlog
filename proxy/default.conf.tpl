server {
    listen ${LISTEN_PORT} ;

    server_name ${REG_DOMAIN};

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
