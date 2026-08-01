FROM python:3.14-slim

WORKDIR /app

COPY Pipfile Pipfile.lock ./

RUN pip install --no-cache-dir pipenv && \
    pipenv install --system --deploy

COPY . .

ENV FLASK_HOST=0.0.0.0
ENV PORT=5000

EXPOSE 5000

CMD ["python", "main.py"]