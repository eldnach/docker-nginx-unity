FROM nginx
COPY webplayer /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
