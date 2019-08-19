FROM alpine:3.10

ADD setup.sh /setup.sh
RUN chmod +x /setup.sh && /setup.sh

ADD mysql-config /etc/cont-init.d/00-configure-mysql
ADD mailtrain-config /etc/cont-init.d/00-configure-mailtrain
ADD mysql /etc/services.d/mysql

EXPOSE 3000

ENV NODE_ENV="production"
ENV MYSQL_ROOT_PASSWORD="mailtrain"
ENV MYSQL_DATABASE="mailtrain"
ENV MYSQL_USER="mailtrain"
ENV MYSQL_PASSWORD="mailtrain"

ENTRYPOINT ["/init"]

WORKDIR "/mailtrain"
CMD ["node", "/mailtrain/index.js"]
