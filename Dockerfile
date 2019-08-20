FROM python:3.7.4

RUN pip install -U pip && pip install pipenv

WORKDIR /opt/pip
ADD Pipfile Pipfile.lock ./

# setup .netrc
ARG GITHUB_TOKEN
RUN echo "machine github.com" > /root/.netrc && \
    echo "login $GITHUB_TOKEN" >> /root/.netrc && \
    echo "passowrd x-oauth-basic" >> /root/.netrc && \
    chmod 600 /root/.netrc

RUN pipenv install --system
RUN rm Pipfile Pipfile.lock
RUN rm /root/.netrc

ADD main.py /src/main.py
CMD ["python", "/src/main.py"]