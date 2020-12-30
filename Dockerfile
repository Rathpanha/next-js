
FROM node:12.13.1

# Setting working directory. All the path will be relative to WORKDIR
WORKDIR /usr/src/app

# Installing dependencies
COPY package*.json ./
RUN yarn install

# Copying source files
COPY . .

# Building app
RUN yarn build

ARG NEXT_PUBLIC_MESSAGE_CLIENT
ENV NEXT_PUBLIC_MESSAGE_CLIENT=${MESSAGE_CLIENT}

RUN echo "value for MESSAGE_CLIENT: [${NEXT_PUBLIC_MESSAGE_CLIENT}] [${MESSAGE_CLIENT}]"

# Running the app
CMD [ "yarn", "start" ]