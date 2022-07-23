FROM ubi8/ubi:8.3

MAINTAINER zakuan zackstam@gmail.com

ENV PORT 8080

RUN yum install -y httpd && yum clean all

RUN sed -ri -e "/^Listen 80/c\Listen ${PORT}" /etc/httpd/conf/httpd.conf && \
    chown -R apache:apache /etc/httpd/logs/ && \
    chown -R apache:apache /run/httpd/

USER apache

EXPOSE ${PORT}

COPY ./src/ /var/www/html

CMD ["httpd", "-D", "FOREGROUND"]
