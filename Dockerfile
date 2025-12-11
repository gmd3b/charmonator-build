FROM node:lts
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt -y install graphicsmagick
USER node
WORKDIR /home/node/charmonator
RUN git clone https://github.com/CHARM-BDF/charmonator.git .
RUN mkdir -vp conf
RUN npm i
ADD ./entrypoint.sh /home/node/charmonator/entrypoint.sh
EXPOSE 5002
CMD ["/bin/bash", "/home/node/charmonator/entrypoint.sh"]
