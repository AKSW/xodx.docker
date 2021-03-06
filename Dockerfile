FROM ubuntu:14.10

MAINTAINER Natanael Arndt <arndt@informatik.uni-leipzig.de>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# update ubuntu trusty
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update

# install some basic packages
# install the nginx server with PHP
# install virtuoso
RUN apt-get install -y \
    git make curl unzip \
    nginx-light php5-fpm php5-odbc php5-curl \
    virtuoso-opensource

# clone ontowiki and get its dependencies
RUN git clone https://github.com/AKSW/xodx.git /var/www/
RUN cd /var/www/ && make install-fb
RUN cp /var/www/config.ini-dist /var/www/config.ini

# configure the ontowiki site for nginx
ADD xodx.conf /etc/nginx/sites-available/
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/xodx.conf /etc/nginx/sites-enabled/

# configure odbc for virtuoso
ADD odbc.ini /etc/

# Add startscript and start
ADD start.sh /start.sh
ADD xodx-docker.fig /xodx-docker.fig
CMD ["/bin/bash", "/start.sh"]

# expose the HTTP port to the outer world
EXPOSE 80
