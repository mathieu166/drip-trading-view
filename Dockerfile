FROM node:16-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
RUN npm run build

COPY . ./
EXPOSE 3000
CMD ["node", "index.js"]
