FROM kernsuite/base:5

ENV DEB_DEPENDENCIES casacore-dev \
                     casacore-data \
                     build-essential \
                     python3-pip \ 
                     libboost-all-dev \ 
                     wcslib-dev \
                     git \
                     libcfitsio-dev
RUN apt-get update
RUN apt-get install -y $DEB_DEPENDENCIES
RUN pip3 install -U pip wheel setuptools
RUN docker-apt-install wget git-all
RUN git clone https://github.com/ratt-ru/CubiCal
WORKDIR CubiCal
RUN pip install ".[lsm-support]"
ENV NUMBA_CACHE_DIR /tmp
