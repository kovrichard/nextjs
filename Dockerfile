FROM node:16-alpine3.15 

RUN apk update && apk upgrade

COPY ./ /usr/src/app/
WORKDIR /usr/src/app/

RUN npm i

EXPOSE 3000

CMD npm run dev
