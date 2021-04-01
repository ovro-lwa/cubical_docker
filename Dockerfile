FROM kernsuite/base:5

ENV DEB_DEPENDENCIES casacore-dev \
                     casacore-data \
                     build-essential \
                     libboost-all-dev \ 
                     wcslib-dev \
                     git \
                     libcfitsio-dev \
		     emacs \
		     python3 \
                     python3-pip
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10
RUN apt-get update -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y $DEB_DEPENDENCIES
RUN pip3 install -U pip wheel setuptools numpy scipy matplotlib ipython
RUN docker-apt-install wget git-all
RUN git clone https://github.com/ovro-lwa/CubiCal
WORKDIR CubiCal
RUN pip install ".[lsm-support]"
ENV NUMBA_CACHE_DIR /tmp
