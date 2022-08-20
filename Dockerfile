FROM node:18-alpine
RUN apk add --no-cache git

WORKDIR /data
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install

COPY ["bin/kingraph", "lib/", "./"]
ENTRYPOINT ["node", "bin/kingraph"]
CMD ["--help"]
VOLUME /data
