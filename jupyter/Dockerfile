FROM continuumio/anaconda3

# Basic jupyter install
RUN /opt/conda/bin/conda install jupyter boto3 requests -y --quiet

# kubernetes/eks utils
RUN curl -o /usr/local/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
  && chmod 755 /usr/local/bin/kubectl \
  && curl -o /usr/local/bin/aws-iam-authenticator -s https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/linux/amd64/aws-iam-authenticator \
  && chmod 755 /usr/local/bin/aws-iam-authenticator

RUN useradd -m -d /home/jupyter -u 501 jupyter

RUN echo "/opt/conda/bin/jupyter notebook --notebook-dir=~/notebooks --ip=0.0.0.0 --port 8888 --no-browser --certfile=/etc/ssl/jupyter.pem --keyfile=/etc/ssl/jupyter.key" > /start.sh & chmod 755 /start.sh

RUN openssl req -batch -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/jupyter.key -out /etc/ssl/jupyter.pem -subj "/C=US/ST=NopeState/L=NopeCity/O=NopeOrg/OU=NopeUnit/CN=*" && chgrp jupyter /etc/ssl/jupyter* && chmod 660 /etc/ssl/jupyter*
EXPOSE 8888
USER jupyter
ARG PASSWORD
RUN jupyter notebook --generate-config
RUN mkdir /home/jupyter/notebooks
#VOLUME /home/jupyter

# Set a jupyter password
RUN python3 -c "import notebook.auth;notebook.auth.security.set_password(password='${PASSWORD:-password}')"
CMD ["/start.sh"]



# docker build -t jupyter .
# docker run -ti --rm --name jupyter -v ~/notebooks:/var/notebooks
