FROM node:12

EXPOSE 8000

RUN yarn global add gatsby-cli

WORKDIR /app

VOLUME /app

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["gatsby", "develop", "-H", "0.0.0.0" ]
