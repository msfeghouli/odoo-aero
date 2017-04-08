FROM odoo:9.0

RUN apt-get update && apt-get install git
RUN pip install simplejson
RUN git clone https://github.com/aeroo/aeroolib && cd aeroolib && python setup setup.py install
