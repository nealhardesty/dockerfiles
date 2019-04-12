FROM continuumio/anaconda3

RUN /opt/conda/bin/conda install jupyter -y --quiet
RUN mkdir /var/notebooks && chmod 1777 /var/notebooks
RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.password= ''" >> ~/.jupyter/jupyter_notebook_config.py

CMD /opt/conda/bin/jupyter notebook --notebook-dir=/notebooks --ip=0.0.0.0 --port 8888 --no-browser --allow-root

EXPOSE 8888
VOLUME /notebooks

# docker build -t jupyter .
# docker run -ti --rm --name jupyter -v ~/notebooks:/var/notebooks
