FROM cypress/base:latest

RUN apt update && apt -y install neofetch && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
ADD ./src /app
WORKDIR /app
RUN npm -y install

WORKDIR /app

CMD [ "bash", "-c", "./runme.sh" ]
