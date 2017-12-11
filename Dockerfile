# Pull base image.
FROM ubuntu:latest

# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential ca-certificates && \
  apt-get install -y software-properties-common && \
  apt-get install -y curl git htop man unzip vim wget && \
  apt-get install -y python python-dev python-pip && \
  add-apt-repository ppa:jonathonf/python-3.6 && \
  apt-get update && \
  apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv && \
  python3.6 -m pip install pip --upgrade && \
  python3.6 -m pip install wheel && \
  apt-get install -y sqlite3 libsqlite3-dev && \
  apt-get install -y python3-scipy python3-pip && \
  apt-get install -y freetype* pkg-config && \
  apt-get autoremove -y
  

# Pandoc & Texlive for Latex Rendering
RUN apt-get install -y -o Acquire::Retries=10 --no-install-recommends \
     texlive-latex-base \
     texlive-xetex latex-xcolor \
     texlive-math-extra \
     texlive-latex-extra \
     texlive-fonts-extra \
     texlive-bibtex-extra \
     fontconfig \
     pandoc \
     lmodern
  
RUN  rm -rf /var/lib/apt/lists/*

# Default to Python3 
RUN echo "alias python=/usr/bin/python3.6" >> /root/.bash_aliases
RUN echo "alias python3=/usr/bin/python3.6" >> /root/.bash_aliases
RUN mv /usr/bin/python /usr/bin/python2
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN \
  pip3 install requests six && \
  pip3 install pytz arrow pdf && \
  pip3 install okpy && \
  pip3 install --upgrade okpy && \
  pip3 install requests six virtualenv && \
  pip3 install networkx html5lib decorator pytz arrow && \
  pip3 install jupyter pandas numpy matplotlib scipy scikit-learn seaborn scikit-image && \
  pip3 install fpdf datascience ipywidgets

# Set environment variables.
ENV HOME /root 

# TODO: Run as non root user
# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
