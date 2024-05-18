FROM nginx:1.25.3

ENV APP_HOST=app
ENV APP_PORT=8000
ENV LISTEN_PORT=80

COPY ./proxy_start.sh /proxy_start.sh
RUN chmod +x /proxy_start.sh

RUN touch /etc/nginx/conf.d/default.conf

COPY ./proxy_params /etc/nginx/
COPY ./default.conf.tpl /etc/nginx/

COPY ./my_domain.crt /etc/ssl/my_domain.crt
COPY ./my_domain.key /etc/ssl/my_domain.key

ENTRYPOINT ["sh", "-c", "/proxy_start.sh"]