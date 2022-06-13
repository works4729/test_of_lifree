FROM ruby:3.0.1-alpine

ARG WORKDIR
ARG API_PORT
ARG RUNTIME_PACKAGES="nodejs tzdata postgresql-dev postgresql git"
ARG DEV_PACKAGES="build-base curl-dev"
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG DB_HOST
ARG DB_NAME
ARG DB_USERNAME
ARG DB_PASSWORD
ARG RAILS_MASTER_KEY

ENV RAILS_MASTER_KEY      $RAILS_MASTER_KEY
ENV AWS_ACCESS_KEY_ID     $AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY
ENV DB_HOST               $DB_HOST
ENV DB_NAME               $DB_NAME
ENV DB_USERNAME           $DB_USERNAME
ENV DB_PASSWORD           $DB_PASSWORD

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    API_PORT=${API_PORT}

WORKDIR ${HOME}

COPY Gemfile* ./

RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
    bundle install -j4 && \
    apk del build-dependencies

COPY . .

EXPOSE ${API_PORT}

CMD ["rails" "server" "-b" "0.0.0.0"]