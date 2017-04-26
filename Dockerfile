FROM odoo:8

USER root

RUN echo 'Rock n Roll'
# install dep

RUN mkdir /opt/aeroo
RUN git clone https://github.com/aeroo/aeroolib.git /opt/aeroo/aeroolib
RUN git clone https://github.com/aeroo/aeroo_docs.git /opt/aeroo/aeroo_docs
WORKDIR /opt/aeroo/aeroolib
RUN python setup.py install
