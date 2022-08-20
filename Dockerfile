FROM node:18-alpine
RUN apk add --no-cache git

WORKDIR /usr/local/kingraph
COPY ["package.json", "package-lock.json*", "yarn.lock", "./"]
RUN npm install
COPY "bin/kingraph" "/usr/local/kingraph/bin/kingraph"
COPY "lib/" "/usr/local/kingraph/lib/"

WORKDIR /data
ENTRYPOINT ["node", "/usr/local/kingraph/bin/kingraph"]
CMD ["--help"]
VOLUME /data
