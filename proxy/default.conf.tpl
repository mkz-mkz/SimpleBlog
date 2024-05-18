server {
    listen ${LISTEN_PORT} ssl;

    server_name ${REG_DOMAIN};
    ssl_certificate /etc/ssl/my_domain.crt;
    ssl_certificate_key /etc/ssl/my_domain.key;

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
