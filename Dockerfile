FROM python:3.9.5-slim-buster
LABEL author="Lan"
LABEL email="vast@tom.com"

COPY . /app
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
WORKDIR /app
RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python3-dev
RUN pip install cffi
RUN pip cache purge
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 12345
CMD ["python","main.py"]
