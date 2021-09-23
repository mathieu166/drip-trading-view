FROM nikolaik/python-nodejs:latest
RUN mkdir -p /usr/src/app
ENV PORT=3000
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY . ./

EXPOSE 3000
CMD ["node", "server.js"]
