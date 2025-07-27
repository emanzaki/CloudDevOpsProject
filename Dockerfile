FROM node:18.14-alpine

WORKDIR /app

COPY ./Todo-List-nodejs .

RUN npm install -f

EXPOSE 4000

ENTRYPOINT ["npm" , "start"]
