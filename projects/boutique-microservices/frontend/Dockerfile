FROM node:20-alpine AS build 
WORKDIR /app
COPY package*.json ./
RUN npm install --production=false 
COPY . . 
RUN npm run build 

FROM nginx:stable-alpine AS prod
RUN addgroup -g 1001 -S nodejs &&\
adduser -u 1001 -S nodejs -G nodejs
COPY --chown=nodejs:nodejs --chmod=775 --from=build /app/build /usr/share/nginx/html
USER nodejs
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
