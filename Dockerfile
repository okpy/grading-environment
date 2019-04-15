# Pull base image.
FROM ubuntu:bionic

# Install Base
RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl git htop man unzip vim wget \
        python3 python3-dev python3-pip python3-setuptools \
 && printf '#!/usr/bin/env bash\npython3 -m pip "$@"' > /usr/bin/pip3 \
 && chmod +x /usr/bin/pip3 \
 && ln -s /usr/bin/pip3 /usr/bin/pip \
 && ln -s /usr/bin/python3 /usr/bin/python \
 && rm -rf /var/lib/apt/lists/*

# Install Packages
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        sqlite3 libsqlite3-dev \
        python3-scipy \
        freetype* pkg-config \
 && pip install --no-cache-dir \
        requests six pytz arrow PyPDF2 virtualenv \
        networkx html5lib decorator \
        jupyter pandas numpy==1.16.2 matplotlib scipy \
        scikit-learn seaborn scikit-image \
        fpdf datascience ipywidgets \
 && pip install --no-cache-dir okpy \
 && pip install --no-cache-dir --upgrade okpy \
 && rm -rf /var/lib/apt/lists/*

# Set environment variables.
ENV HOME /root

# TODO: Run as non root user
# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
