# For Building image containing a Keras DNN. 

FROM python:latest

RUN pip install virtualenv
RUN python -m virtualenv /venv
RUN /venv/bin/pip install Keras
RUN /venv/bin/pip install numpy
RUN /venv/bin/pip install --upgrade tensorflow

# Adding dataset in the image
RUN curl -O https://ai.stanford.edu/~amaas/data/sentiment/aclImdb_v1.tar.gz
RUN tar -xf aclImdb_v1.tar.gz
RUN rm -r aclImdb/train/unsup

# Adding script in the image
ADD text_classification.py /

ENTRYPOINT [ "/venv/bin/python", "./text_classification.py" ]