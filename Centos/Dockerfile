FROM centos:8

#Set the url of repos
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
COPY  Files/centos-mirror.conf /etc/yum.repos.d/centos-mirror.conf

# Install required apps
RUN yum install -y httpd createrepo yum-utils cronie 

# # Create needed Folders
RUN mkdir -p /var/www/html/repos
#------------------
#COPY ./Files/apache2.conf /etc/apache2/apache2.conf
#COPY ./Files/000-default.conf /etc/apache2/sites-enabled/000-default.conf

RUN createrepo /var/www/html/repos
#------------------
# Synchronize HTTP Repositories
#RUN echo "@reboot root /usr/bin/reposync -p /var/www/html/repos/ --download-metadata --source --downloadcomps  >> /var/log/reposync.log 2>&1" > /etc/cron.d/reposync-job
RUN echo "0 */12 * * * root /usr/bin/reposync -p /var/www/html/repos/ --download-metadata --source --downloadcomps >> /var/log/reposync.log 2>&1" >> /etc/cron.d/reposync-job
#RUN chmod 0644 /etc/cron.d/reposync-job
#RUN crontab /etc/crontab
#RUN echo "/usr/bin/reposync -p /var/www/html/repos/ --download-metadata --source --downloadcomps >> /var/log/reposync.log 2>&1" >> /etc/bashrc

# Create the New Repository

EXPOSE 80
# Start the Apache HTTP server
#CMD ["/usr/bin/reposync -p /usr/local/apache2/htdocs/repos --download-metadata --source --downloadcomps >> /var/log/reposync.log 2>&1 && httpd -D FOREGROUND"]

#CMD ["/usr/bin/reposync -p /var/www/html/repos/ --download-metadata --source --downloadcomps >> /var/log/reposync.log 2>&1 && httpd -D FOREGROUND"]


#CMD ["httpd", "-D", "FOREGROUND"]


# Copy a shell script to the container
COPY ./Files/entrypoint.sh /entrypoint.sh

# Grant execute permissions to the script
RUN chmod +x /entrypoint.sh

# Set the script as the entrypoint
ENTRYPOINT ["/entrypoint.sh"]