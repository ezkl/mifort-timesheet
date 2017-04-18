FROM node:latest

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install && npm install -g bower
COPY bower.json /usr/src/app/
RUN bower install --allow-root
COPY . /usr/src/app/
RUN npm install -g grunt
RUN grunt build

CMD ["npm", "start"]
