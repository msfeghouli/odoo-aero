FROM odoo:9.0

USER root

# install dependencies
RUN apt-get update && apt-get install -y git python3-pip python3-uno
RUN pip3 install jsonrpc2 daemonize
RUN pip install simplejson xlrd

# install aeroo lib/driver for odoo
RUN git clone https://github.com/aeroo/aeroolib /var/aeroolib
WORKDIR /var/aeroolib
RUN python setup.py install


# install aeroo
RUN mkdir /opt/aeroo
WORKDIR /opt/aeroo
RUN git clone https://github.com/aeroo/aeroo_docs.git /opt/aeroo/aeroo_docs
RUN echo Y | python3 /opt/aeroo/aeroo_docs/aeroo-docs start -c /etc/aeroo-docs.conf
RUN ln -s /opt/aeroo/aeroo_docs/aeroo-docs /etc/init.d/aeroo-docs
RUN update-rc.d aeroo-docs defaults
RUN service aeroo-docs start
