FROM python:3.9

WORKDIR /code

COPY . /code/

RUN python -m pip install --upgrade pip
RUN apt-get -y update && apt-get install -y --no-install-recommends g++ gcc gfortran libxslt-dev libopenblas-dev
RUN pip install coverage snowballstemmer
RUN pip install --upgrade pip
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
RUN pip install -e .

#COPY ./requirements.txt /code/requirements.txt

EXPOSE 8000

CMD ["uvicorn", "verbecc_svc:app", "--host", "0.0.0.0", "--reload", "--port", "8000", "--workers", "2"]


#FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9-alpine3.14

#MAINTAINER "Brett Tolbert <bretttolbert@gmail.com>"

#COPY . /code
#WORKDIR /code

#RUN python -m pip install --upgrade pip
#RUN apk add --update --no-cache g++ gcc gfortran libxslt-dev openblas-dev
#RUN pip install coverage snowballstemmer
#RUN pip install --upgrade pip
#RUN pip install --no-cache-dir -r requirements.txt
#RUN pip install -e .

#EXPOSE 8000

##MD ["uvicorn", "verbecc_svc:app", "--host", "0.0.0.0", "--reload", "--port", "8000"]
