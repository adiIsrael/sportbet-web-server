FROM nginx:alpine
# Just here for test deploy in Dockerfile
COPY ./html /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
