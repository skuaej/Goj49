FROM python:3.8-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=1

# Install minimal system deps
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip tools
RUN pip install --upgrade pip setuptools wheel

WORKDIR /app
COPY . /app

# Install python deps
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "-m", "TEAMZYRO"]
