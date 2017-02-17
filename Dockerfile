FROM sonarqube:6.2

MAINTAINER Antonio Manuel Hernández Sánchez <contact@antoniohs.com>

RUN apt-get update && \
  apt-get install -y apt-transport-https lsb-release ca-certificates && \
  wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
  echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN PACKAGES_TO_INSTALL="php7.1-dev php7.1-intl php7.1-xml curl unzip" && \
  apt-get update && \
  apt-get install -y --allow-unauthenticated $PACKAGES_TO_INSTALL && \
  apt-get autoremove -y && \
  apt-get clean && \
  apt-get autoclean
