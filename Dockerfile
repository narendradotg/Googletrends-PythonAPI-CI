FROM centos/python-36-centos7
USER root
RUN mkdir -p /app
COPY  trends.py /app/googletrendsapi/trends.py
COPY requirements.txt /app/googletrendsapi/requirements.txt
RUN pip install --upgrade pip
RUN pip3.6 install -r /app/googletrendsapi/requirements.txt
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
WORKDIR /app/googletrendsapi
