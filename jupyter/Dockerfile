FROM continuumio/anaconda3

RUN /opt/conda/bin/conda install jupyter boto3 -y --quiet
RUN useradd -m -d /home/jupyter -u 501 jupyter
RUN openssl req -batch -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/jupyter.key -out /etc/ssl/jupyter.pem -subj "/C=US/ST=NopeState/L=NopeCity/O=NopeOrg/OU=NopeUnit/CN=*" && chgrp jupyter /etc/ssl/jupyter* && chmod 660 /etc/ssl/jupyter*
EXPOSE 8888
USER jupyter
ARG PASSWORD
RUN jupyter notebook --generate-config
RUN mkdir /home/jupyter/notebooks
#VOLUME /home/jupyter
RUN echo initial password: ${PASSWORD:-password}
RUN python3 -c "import notebook.auth;notebook.auth.security.set_password(password='${PASSWORD:-password}')"
CMD /opt/conda/bin/jupyter notebook --notebook-dir=~/notebooks --ip=0.0.0.0 --port 8888 --no-browser --certfile=/etc/ssl/jupyter.pem --keyfile=/etc/ssl/jupyter.key



# docker build -t jupyter .
# docker run -ti --rm --name jupyter -v ~/notebooks:/var/notebooks
