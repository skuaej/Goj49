
FROM python:3.8.5-slim-buster

ENV PIP_NO_CACHE_DIR=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies (git required)
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip & setuptools
RUN pip3 install --upgrade pip setuptools

# Copy app
COPY . /app/
WORKDIR /app/

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Run bot
CMD ["python3", "-m", "TEAMZYRO"]
