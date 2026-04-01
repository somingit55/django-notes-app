FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && pip install --no-cache-dir -r requirements.txt \
    && rm -rf /var/lib/apt/lists/*

COPY . .

EXPOSE 8000

CMD ["gunicorn", "notesapp.wsgi:application", "--bind", "0.0.0.0:8000"]
