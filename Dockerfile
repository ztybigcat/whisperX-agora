# Use an official NVIDIA CUDA base image
FROM nvidia/cuda:12.4.1-base-ubuntu22.04

# Set a working directory
WORKDIR /app

# Copy the backend directory contents into the container at /app
COPY ./backend /app/

# Install Python and ffmpeg
RUN apt-get update && apt-get install -y \
    python3.11 \
    python3-pip \
    ffmpeg \
    git \
 && rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /app/
# Install Python dependencies
RUN python3.11 -m pip install --no-cache-dir -r requirements.txt

# Set the environment variable to use GPUs
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

EXPOSE 5000

ENV LD_LIBRARY_PATH=/app:$LD_LIBRARY_PATH
# Command to run the backend script
CMD ["python3.11", "backend.py"]
