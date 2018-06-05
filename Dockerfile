FROM elicocorp/odoo-china:10.0
MAINTAINER Elico Corp <info@elico-corp.com>

ENV PYCHARM_HOME=/bin/pycharm
RUN mkdir ${PYCHARM_HOME}
RUN apt-get update &&\
    apt-get install -y \ 
        wget \ 
        git \ 
        libxtst6 \ 
        libxi6 \
        python-software-properties \
        software-properties-common \
        --no-install-recommends
RUN wget https://download.jetbrains.8686c.com/python/pycharm-community-2018.1.2.tar.gz -O /tmp/pycharm.tar.gz && \
        tar -xzvf /tmp/pycharm.tar.gz -C ${PYCHARM_HOME} --strip=1
RUN apt-get install -f && add-apt-repository ppa:openjdk-r/ppa && apt-get update && apt-get install -y openjdk-7-jre
RUN rm -rf /var/lib/apt-lists; rm -rf /tmp/*; apt-get purge wget -y; apt-get autoremove -y 
RUN /usr/bin/python2.7 ${PYCHARM_HOME}/helpers/pydev/setup_cython.py build_ext --inplace
ADD sources/boot_dev /usr/bin/boot
ADD sources/startup.sh /opt/scripts/startup.sh
