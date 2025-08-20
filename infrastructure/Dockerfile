
FROM node:24.6.0-alpine3.22 AS installer
WORKDIR /usr
COPY package.json ./
RUN npm install


FROM node:23.11.0-alpine3.21 AS builder
WORKDIR /usr
COPY ./ ./
COPY --from=installer /usr/node_modules ./node_modules
RUN npm run build

FROM node:23.11.0-alpine3.21 AS runner
WORKDIR /usr
COPY ./ ./
COPY --from=builder /usr/dist ./dist
COPY --from=installer /usr/node_modules ./node_modules
COPY package.json package.json

CMD ["npm", "run", "start"]
