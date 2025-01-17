FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*
  
RUN git clone https://github.com/papaigwe1234/KAMB-version-VF /root/my_app
WORKDIR /root/my_app/


COPY package.json .
RUN npm install pm2 -g
RUN npm install

COPY . .

EXPOSE 8000

CMD ["npm","run","web"]
