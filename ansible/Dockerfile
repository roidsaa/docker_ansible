FROM ubuntu:18.04
RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
        python3.8 \
        sudo && \
    ln -s /usr/bin/python3.8 /usr/bin/python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN useradd -m ansible && \
    usermod -aG sudo ansible && \
    sed -i -e 's/%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers
USER ansible
WORKDIR /home/ansible
