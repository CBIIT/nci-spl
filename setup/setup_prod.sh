#!/bin/bash

echo "*** Setting up Environment for for Production"
echo ""
echo "Setting up cache"
scripts/cache_prod.sh
echo ""
echo "Remove devel module"
echo ""
drush pm-uninstall devel -y
echo "Clearing Cache"

echo ""
echo "Set logging to 'some'"
echo ""
drush cset system.logging error_level "some" -y

drush cr
