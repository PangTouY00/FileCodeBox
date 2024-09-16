FROM python:3.9.5-slim-buster
LABEL author="Lan"
LABEL email="vast@tom.com"

COPY . /app
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
WORKDIR /app
RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python3-dev curl
RUN pip install --upgrade pip setuptools
RUN pip install --extra-index-url https://www.piwheels.org/simple cryptography==43.0.1
RUN pip install -r requirements.txt
EXPOSE 12345
CMD ["python","main.py"]
