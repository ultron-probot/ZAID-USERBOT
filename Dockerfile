# Base image
FROM python:3.9-slim-bookworm

# Prevent interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Update OS and install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN python3 -m pip install --upgrade pip --no-cache-dir

# Set workdir
WORKDIR /app

# Copy all files
COPY . /app/

# Install Python requirements
RUN pip3 install --no-cache-dir -r requirements.txt

# Set default command
CMD ["bash", "start.sh"]
