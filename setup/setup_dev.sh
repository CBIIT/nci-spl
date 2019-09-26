#!/bin/bash

echo "*** Setting up Environment for for Development"
echo ""
echo "Setting up cache"
scripts/cache_dev.sh
echo ""
echo "Enable Devel module"
echo ""
drush pm-enable devel -y
echo ""
echo "Set logging to 'some'"
echo ""
drush cset system.logging error_level "verbose" -y

echo "Clearing Cache"
drush cr

