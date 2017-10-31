FROM ubuntu  
MAINTAINER walfrn@outlook.com
RUN apt-get update && apt-get upgrade -y && apt-get -y install curl \
&& curl -sL https://deb.nodesource.com/setup_8.x | bash - 
RUN apt-get install -y nodejs && apt-get -y install apache2 php libapache2-mod-php php-mysql php-curl php-gd php-pear php-imap php-mcrypt php-memcache php-pspell php-snmp php-xmlrpc php-xml php-zip php-bz2 php-pclzip && apt-get clean
RUN chmod 775 -R /usr/lib/node_modules/
RUN npm -g config set user root
RUN npm install --unsafe-perm
RUN npm install -g node-gyp
RUN npm config set registry http://registry.npmjs.org/
RUN npm set progress=false
RUN npm install -g @angular/cli
RUN npm install -g typescript
RUN npm cache clean
RUN a2enmod rewrite
RUN service apache2 restart
RUN chmod 775 -R /usr/lib/node_modules/
WORKDIR /var/www/html
EXPOSE 80
