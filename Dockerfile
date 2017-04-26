FROM odoo:8

USER root

RUN echo 'Rock n Roll'
# install dep
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
apt-get install -y apt-utils git python-setuptools && \
apt-get install -y python-genshi python-cairo python-lxml 

RUN mkdir /opt/aeroo
RUN git clone https://github.com/aeroo/aeroolib.git /opt/aeroo/aeroolib
RUN git clone https://github.com/aeroo/aeroo_docs.git /opt/aeroo/aeroo_docs
WORKDIR /opt/aeroo/aeroolib
RUN python setup.py install
USER odoo
