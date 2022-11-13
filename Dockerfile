FROM nginx:1.17.1-alpine
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
COPY ./dist/myapp /usr/share/nginx/html 
EXPOSE 4201
CMD ["nginx", "-g", "daemon off;"]
