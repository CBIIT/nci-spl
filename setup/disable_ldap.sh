#!/bin/bash

cd /local/drupal/site

echo "Disable ldap server info before export config or saving database."
echo "*** Mask server info"
echo ""
# drush cget ldap_servers.server.nci
# Mask address and port
drush cset ldap_servers.server.nci address unknown -y
drush cset ldap_servers.server.nci port 389 -y

echo "*** Uninstalling ldap_authentication module"
echo ""
# Uninstall ldap_authentication
drush pm-uninstall ldap_authentication -y

echo "*** Completed"