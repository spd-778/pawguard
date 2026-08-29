LABEL org.opencontainers.image.source="https://github.com/spd-778/pawguard"
FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
