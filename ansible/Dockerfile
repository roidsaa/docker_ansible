FROM ubuntu:18.04
RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
        bzip2 \
        ca-certificates \
        curl \
        git \
        gosu \
        libglib2.0-0 \
        libxext6 \
        libsm6 \
        libxrender1 \
        sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN useradd -m ansible && \
    usermod -aG sudo ansible && \
    umask 0002 && \
    sed -i -e 's/%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers
USER ansible
ENV HOME /home/ansible
WORKDIR /home/ansible
RUN MINICONDA=Miniconda3-latest-Linux-x86_64.sh && \
    curl -LO https://repo.continuum.io/miniconda/$MINICONDA && \
    /bin/bash $MINICONDA -b -p $HOME/miniconda3 && \
    rm -rf $MINICONDA &&\
    $HOME/miniconda3/bin/conda update -y conda && \
    $HOME/miniconda3/bin/conda update -y --all && \
    $HOME/miniconda3/bin/pip install -U pip && \
    echo '. $HOME/miniconda3/etc/profile.d/conda.sh' >>$HOME/.bashrc && \
    echo 'export PATH=$HOME/miniconda3/bin:$PATH' >>$HOME/.profile
ENV PATH /home/ansible/miniconda3/bin:$PATH

