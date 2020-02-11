# specify the node base image with your desired version node:<version>
FROM node:10-alpine

LABEL maintainer="me@badgateway.me"

RUN mkdir -p /usr/app

# Copy source code
COPY src /usr/app
COPY package.json /usr/app
COPY package-lock.json /usr/app

WORKDIR /usr/app

RUN npm install -only=production
RUN npm audit fix

# Chown all the files to the app user.
RUN chown -R node:node /usr/app

# Switch to 'node'
USER node

# expose container port to host
EXPOSE 8000

#ENTRYPOINT ["/bin/sh", "-c"]
CMD [ "npm", "start" ]

