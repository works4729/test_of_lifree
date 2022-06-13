FROM node:16.13.2-alpine

ARG WORKDIR
ARG API_URL
ARG FRONT_PORT

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0 \
    API_URL=${API_URL} \
    FRONT_PORT=${FRONT_PORT}

WORKDIR ${HOME}

COPY package*.json ./
RUN yarn install

COPY . ./

# RUN yarn run build

EXPOSE ${FRONT_PORT}