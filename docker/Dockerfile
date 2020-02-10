# specify the node base image with your desired version node:<version>
FROM node:10-alpine

# Create app directory
RUN mkdir /app && chown node:node /app
WORKDIR /app

COPY --chown=node:node package*.json ./
RUN npm install

# Fix vulnerabilites
RUN npm audit fix

# Bundle app source
COPY . .

# replace this with your application's default port
EXPOSE 8000

CMD [ "npm", "start" ]

