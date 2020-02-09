FROM node:10

#Create app directory 
WORKDIR /usr/src/app

#Install App Dependencies
COPY package*.json ./

RUN npm install

#Bundle app store
COPY . .

EXPOSE 8082

CMD [ "node", "server.js" ]

