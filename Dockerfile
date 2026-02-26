# Updated base image (Bookworm = latest stable Debian)
FROM nikolaik/python-nodejs:python3.10-nodejs19-bookworm

# Install ffmpeg safely
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Upgrade pip first (important)
RUN pip3 install --no-cache-dir --upgrade pip

# Install requirements
RUN pip3 install --no-cache-dir -r requirements.txt

# Start bot
CMD ["bash", "start"]
