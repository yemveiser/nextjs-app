FROM node:alpine3.16 As build
WORKDIR /client
COPY . .
RUN npm install
RUN npm run dev

FROM nginx:1.19.0 As run
COPY --from=build /client/dev /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
