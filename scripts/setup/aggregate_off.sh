#!/bin/bash

drush -y config-set system.performance css.preprocess 0
drush -y config-set system.performance js.preprocess 0