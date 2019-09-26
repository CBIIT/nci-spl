#!/bin/bash

cd /local/drupal/site

#cp -p /tmp/services.yml /local/drupal/site/web/sites/default/
#cp -p /tmp/settings.php /local/drupal/site/web/sites/default/
#cp /tmp/.htaccess /local/drupal/site

if [ -d "/local/drupal/site/docker/apache" ];then
    echo "Adding addition apache config files"
    cp /local/drupal/site/docker/apache/* /etc/httpd/conf.d
fi
#echo ""
#echo "*** Compose install"
#echo ""

#composer install
echo ""
echo ""
echo "***** Initialize DRUPAL for first time use."
echo 
echo "*** Setting the website on docker after compose install"
echo ""
echo "*Setting up directory permissions"
chown -R root:apache /local/drupal
echo "chmod -R 775 /local/drupal/site/web/sites/default/files"
echo "Recursive doesn't work for s3fs.  So skipping for now."
chmod -R 775 /local/drupal/site/web/sites/default/files
echo "chmod -R 664 /local/drupal/site/web/sites/default/s*"
chmod 664 /local/drupal/site/web/sites/default/s*

#echo ""
#echo "*Add symbolic link to shared volume"
#echo "username = $username (i.e. the project name for docker)"
#echo "ln -s /mnt/s3fs/$username /local/drupal/site/web/sites/default/files/assets/s3fs"
#ln -s /mnt/s3fs /local/drupal/site/web/sites/default/files/assets/s3fs
#echo "ls -latr"
#ls -latr

#echo "Import Config"
#echo "drush cim -y"
#drush cim -y
echo "* Load Database"
drush sql-cli < /local/drupal/site/database.sql

echo "* Enable LDAP"

./setup/enable_ldap.sh

echo "* Clear Cache"
drush cr




