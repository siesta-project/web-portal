#!/bin/sh
#
# Building options:
#
# Commands to build the Siesta website from the Jekyll sources
# PRODUCTION VERSION
# USE local development settings to try things out before deployment!!
#
# For the ICMAB site
#
###jekyll build --config _config_icmab.yml
# The following is a specific directory that is symlinked to 'siesta'
###rsync -av _site/ internal.icmab.es:siesta-jekyll
###ssh internal.icmab.es "chgrp -R www-data siesta-jekyll"
#
# For the GitHub pages site
# (an implicit 'jekyll build' will be done automatically, using the
#  default _config.yml file)
#
# For local development
#
jekyll build --config _config_dev.yml


