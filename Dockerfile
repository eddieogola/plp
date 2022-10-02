FROM python:3.9-alpine

WORKDIR /sokomob_api

ENV PYTHONUNBUFFERED=1

COPY requirements.txt /sokomob_api/requirements.txt

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY . /sokomob_api/

EXPOSE 8000

CMD ["python", "manage.py","runserver"]