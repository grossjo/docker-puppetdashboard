# HEADER
FROM          abaranov/base
MAINTAINER    abaranov@linux.com

ENV           UPDATED_AT 2015-03-30

ENV           REPO_PUPPETLABS_URL http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm

# Puppetlabs repo
RUN           rpm --quiet -Uvh ${REPO_PUPPETLABS_URL}

# Update yum cache
RUN           yum -y -q makecache && \
              yum -y -q update && \
              yum -y -q clean all

# Install packages
RUN           yum -y -q install \
                sudo \
                puppet-dashboard && \
              yum -y -q clean all

# Init Conifiguration files
ADD           scripts/init_database.sh /my_init/10_init_database.sh
ADD           scripts/init_settings.sh /my_init/20_init_settings.sh

# Require tty
RUN           sed -i 's/^Defaults\s*requiretty/#Default requiretty/g' /etc/sudoers

EXPOSE        3000
# ADD start script
ADD           scripts/start.sh /start.sh
# Default CMD
CMD ["/start.sh"]
