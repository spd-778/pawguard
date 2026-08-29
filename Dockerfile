FROM nginx:alpine

LABEL org.opencontainers.image.source="https://github.com/spd-778/pawguard"

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
