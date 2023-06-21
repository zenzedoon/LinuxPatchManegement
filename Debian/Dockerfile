# Use Debian as the base image
FROM debian:11 

# Set metadata for the image
LABEL maintainer="admzbe07"
LABEL version="1.0"
LABEL Description="Local mirror for apt packages"

# Update the package lists and install apt-mirror
RUN apt-get update && apt-get install apt-mirror -y && apt-get install apache2 -y && apt-get install cron -y && apt-get install netselect-apt -y

# Copy the apt-mirror configuration file
COPY ./Files/mirror.list /etc/apt/mirror.list

# Copy the config file of apache server
COPY ./Files/apache2.conf /etc/apache2/apache2.conf

# Copy the default site of apache
COPY ./Files/000-default.conf /etc/apache2/sites-enabled/000-default.conf 

# Run the apt-mirror on startup & every 12h 
RUN echo '0 */12 * * * root /usr/bin/apt-mirror >> /var/log/mirror.log 2>&1' > /etc/cron.d/apt-mirror
#RUN echo "@reboot apt-mirror" >> /etc/crontab
#RUN chmod 0644 /etc/crontab
#RUN crontab /etc/crontab
#RUN echo "/usr/bin/apt-mirror >> /var/log/mirror.log 2>&1" >> /etc/bashrc

# Run the Apache in Background 
#CMD  apache2ctl -D FOREGROUND 
CMD ["/bin/bash", "-c", "/usr/bin/apt-mirror >> /var/log/mirror.log 2>&1 & apache2ctl -D FOREGROUND"]