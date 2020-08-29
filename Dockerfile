FROM centos:7

ARG PYTHON_VERSION='3.7.1'
ARG DJANGO_VERSION='2.1.5'

RUN yum -y update
RUN yum -y groupinstall "Development Tools"
RUN yum -y install \
           kernel-devel \
           kernel-headers \
           gcc-c++ \
           patch \
           libyaml-devel \
           libffi-devel \
           autoconf \
           automake \
           make \
           libtool \
           bison \
           tk-devel \
           zip \
           wget \
           tar \
           gcc \
           zlib \
           zlib-devel \
           bzip2 \
           bzip2-devel \
           readline \
           readline-devel \
           sqlite \
           sqlite-devel \
           openssl \
           openssl-devel \
           git \
           gdbm-devel \
           python-devel

RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"

# Pythonインストール
ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH

RUN git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    eval "$(pyenv init -)"

RUN pyenv install ${PYTHON_VERSION} && \
    pyenv global ${PYTHON_VERSION}

# pipインストール
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN source ~/.bashrc && pip install -U pip

# readlineインストール
RUN source ~/.bashrc && \
    pip install readline && \
    pip install virtualenv && \
    pip install Django==${DJANGO_VERSION}

WORKDIR /code

CMD ["/bin/bash"]
