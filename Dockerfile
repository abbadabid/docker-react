#This is a multi-step process docker-file, the output build folder we get after running npm run build will be used in nginx image
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm i
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html