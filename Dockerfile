FROM node:17-alpine AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN yarn install

COPY . .

RUN yarn run build 

#prod stage

FROM node:17-alpine

WORKDIR /usr/src/app

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

COPY --from=build /usr/src/app/dist ./dist

COPY package*.json ./

RUN yarn install --only=production

RUN rm package*.json

EXPOSE 5000

CMD ["node","dist/main.ts"]

