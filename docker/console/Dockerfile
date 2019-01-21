FROM centos:7

LABEL maintainer="ajie.lee@gmail.com"

ENV container docker

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm

# normal updates
RUN yum -y update

# install php relatived libraries
RUN yum -y install php72 php72-php php72-php-opcache php72-php-bcmath php72-php-cli php72-php-common php72-php-gd php72-php-intl php72-php-json php72-php-mbstring php72-php-pdo php72-php-pdo-dblib php72-php-pear php72-php-pecl-mcrypt php72-php-xmlrpc php72-php-xml php72-php-mysql php72-php-soap php72-php-pecl-zip php72-php-pecl-mongodb php72-php-pecl-xdebug php72-php-pecl-yaml

# make a soft link for php72
RUN ln -s /usr/bin/php72 /usr/bin/php

# install dev tools
RUN yum -y install epel-release iproute at curl crontabs wget which git

# install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --filename=/usr/bin/composer
RUN php -r "unlink('composer-setup.php');"

# change password of root user
RUN echo 'root:password' | chpasswd

# create `dev`
RUN useradd -ms /bin/bash dev

# install zsh
RUN yum -y install zsh
RUN command -v zsh | tee -a /etc/shells
RUN chsh -s "$(command -v zsh)" "dev"

# wait a little bit
RUN sleep 3

# change user
USER dev
WORKDIR /app/

# instal oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# config on-my-zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
RUN sed -i 's/ZSH_THEME=.*/ZSH_THEME=\"ys\"/' ~/.zshrc
RUN echo "# set timezone" >> ~/.zshrc
RUN echo "TZ='America/Toronto'; export TZ" >> ~/.zshrc

CMD ["/usr/sbin/init"]
