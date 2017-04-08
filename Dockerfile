FROM odoo:9.0

USER root

RUN apt-get update
RUN apt-get install -y git
RUN pip install simplejson
RUN git clone https://github.com/aeroo/aeroolib /var/aeroolib
WORKDIR /var/aeroolib
RUN python setup.py install
