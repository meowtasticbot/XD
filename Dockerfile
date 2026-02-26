FROM python:3.10-slim-bookworm

# Install ffmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg git curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Upgrade pip
RUN pip install --upgrade pip

# Install requirements
RUN pip install --no-cache-dir -r requirements.txt

# Start bot
CMD ["bash", "start"]
