FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:20-alpine AS prod
WORKDIR /app
RUN addgroup -g 1001 -S nodejs &&\
adduser -u 1001 -S nodejs -G nodejs
COPY --chown=nodejs:nodejs --chmod=775 --from=build /app/dist ./dist
USER nodejs
EXPOSE 3005
CMD ["node", "dist/index.js"]
