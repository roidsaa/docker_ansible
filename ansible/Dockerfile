FROM ubuntu:18.04
RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        gosu \
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
    curl -LO https://repo.anaconda.com/miniconda/$MINICONDA && \
    /bin/bash $MINICONDA -b -p $HOME/miniconda && \
    rm -rf $MINICONDA &&\
    $HOME/miniconda/bin/conda update -y conda && \
    $HOME/miniconda/bin/conda update -y --all && \
    $HOME/miniconda/bin/pip install -U pip && \
    $HOME/miniconda/bin/conda clean -tipsy && \
    find $HOME/miniconda/ -follow -type f -name '*.a' -delete && \
    find $HOME/miniconda/ -follow -type f -name '*.js.map' -delete && \
    echo '. $HOME/miniconda/etc/profile.d/conda.sh' >>$HOME/.bashrc && \
    echo 'conda activate base' >>$HOME/.bashrc && \
    echo 'export PATH=$HOME/miniconda/bin:$PATH' >>$HOME/.profile && \
    $HOME/miniconda/bin/conda clean -afy
ENV PATH /home/ansible/miniconda/bin:$PATH

