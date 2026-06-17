FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY . . 
RUN addgroup -g 1001 -S nodejs &&\
adduser -u 1001 -S nodejs -G nodejs
USER nodejs
EXPOSE 3004
CMD ["node", "src/server.js"] 
