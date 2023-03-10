FROM node:fermium-alpine 

WORKDIR /app

COPY . /app

# Install dependencies
RUN npm ci && npm prune --prod

EXPOSE 8080

CMD ["npm", "start"]

# FROM node:12-alpine
# WORKDIR /usr/src/app
# COPY package.json /usr/src/app/
# RUN npm install
# # Copy source
# COPY server.js /usr/src/app
