#!/bin/bash

# Run reposync command
#          /usr/bin/reposync -p /var/www/html/repos/ --download-metadata --source --downloadcomps >> /var/log/reposync.log 2>&1

#          Start the httpd server
#exec httpd -D FOREGROUND

/usr/bin/reposync -p /var/www/html/repos/ --download-metadata --source --downloadcomps >> /var/log/reposync.log 2>&1 & exec httpd -D FOREGROUND