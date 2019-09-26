#!/bin/bash

cd /local/drupal/site

echo "Peform this after loading database or importing config"
echo ""
echo "* Setting up ldap server and port, turning on ldap_authentication"
drush cset ldap_servers.server.nci address $ldap_address -y
drush cset ldap_servers.server.nci port $ldap_port -y

echo "* Enable ldap_authentication"
drush pm-enable ldap_authentication -y
drush cset ldap_authentication.settings sids.nci nci -y

