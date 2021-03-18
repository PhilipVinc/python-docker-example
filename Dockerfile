FROM       nvidia/cuda:11.2.2-devel-ubuntu20.04
FROM	   python

RUN 	   apt-get update
RUN 	   apt-get install -y openmpi-bin libopenmpi-dev
RUN        pip install pipenv

COPY       . /testing

WORKDIR    /testing

ENV        SHELL=/bin/bash

RUN        pipenv install 

ENTRYPOINT ["pipenv", "run"]

CMD        ["pytest", "."]