#!/bin/bash
systemctl stop firewalld
systemctl disable firewalld

dnf -y install httpd
systemctl start httpd
systemctl enable httpd

dnf -y install mod_ssl openssl
systemctl restart httpd

dnf -y install mariadb-server
systemctl start mariadb
systemctl enable mariadb

dnf -y install php php-common php-mysqlnd php-gd php-imap php-xml php-cli php-opcache php-mbstring
systemctl restart httpd

echo '<?php' > /var/www/html/info.php
echo ' echo phpinfo();' > /var/www/html/info.php
echo '?>' > /var/www/html/info.php
chomd 777 /var/www/html/info.php
echo LAMP was installed.
echo open http://localhost/info.php

mysql_secure_installation
