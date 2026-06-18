FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:20-alpine AS prod
WORKDIR /app

RUN addgroup -g 1001 -S nodejs && \
    adduser -u 1001 -S nodejs -G nodejs

RUN chown -R nodejs:nodejs /app

COPY --chown=nodejs:nodejs --from=build /app/package*.json ./

USER nodejs

RUN npm ci --omit=dev

COPY --chown=nodejs:nodejs --chmod=775 --from=build /app/dist ./dist

EXPOSE 3003
CMD ["node", "dist/index.js"]
