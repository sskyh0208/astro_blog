FROM python:3.12

# 既存のパッケージインストール
RUN apt-get update && apt-get install -y \
    jq \
    wget \
    gettext \
    zip \
    less \
    vim \
    git \
    docker.io \
    curl \
    gnupg \
    mandoc \
    awscli \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg &&\
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list &&\
    apt update && apt install terraform

# Pythonパッケージのインストール
COPY ./requirements.txt /src/terraform/requirements.txt
RUN pip install -r /src/terraform/requirements.txt

WORKDIR /src/terraform