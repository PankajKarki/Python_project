FROM python:3.8

RUN mkdir -p /app
COPY . main.py /app/
WORKDIR /app
RUN pip install -r requirements.txt
RUN python -m textblob.download_corpora
EXPOSE 8000
CMD ["main.py", "--host=0.0.0.0", "--reload"]
ENTRYPOINT [ "python" ]