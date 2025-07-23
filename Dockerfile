FROM python:3.11-alpine

WORKDIR /app

COPY ./FinalProject .

RUN pip install -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["python" ,"app.py"]
