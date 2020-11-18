#!/bin/sh
#
# Commands to build the Siesta website from the Jekyll sources
# PRODUCTION VERSION
# USE local development settings to try things out before deployment!!
#
# For the hosting site
#
jekyll build --config _config_hosting_icmab.yml
#
# You need some setup for rclone to work
# Use 'copy' instead of 'sync' to avoid deleting files for now
#
rclone copy -P --no-traverse _site siesta_hosting:public_html/siesta
#
# For the GitHub pages site
# (an implicit 'jekyll build' will be done automatically, using the
#  default _config.yml file)
#
# For local development
#
#jekyll build --config _config_dev.yml


