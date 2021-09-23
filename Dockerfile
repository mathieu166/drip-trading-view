FROM python:2
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
RUN npm run build

COPY . ./
EXPOSE 3000
CMD ["node", "server.js"]
