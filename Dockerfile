FROM centos/python-36-centos7
USER root
RUN mkdir -p /app
COPY  trends.py /app/googletrendsapi/trends.py
COPY requirements.txt /app/googletrendsapi/requirements.txt
RUN pip install --upgrade pip
RUN pip3.6 install -r /app/googletrendsapi/requirements.txt
WORKDIR /app/googletrendsapi
