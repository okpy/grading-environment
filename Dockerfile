# Pull base image.
FROM ubuntu:latest

# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y curl git htop man unzip vim wget && \
  apt-get install -y python python-dev && \
  add-apt-repository -y ppa:fkrull/deadsnakes && \
  apt-get install -y python3.5 python3.5-dev && \
  apt-get install -y  sqlite3 libsqlite3-dev && \
  rm -rf /var/lib/apt/lists/*

RUN \
  pip install okpy requests && \
  pip install jupyter pandas numpy matplotlib scipy scikit-learn seaborn scikit-image   && \

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
