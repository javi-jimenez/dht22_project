# Dockerfile for multi-architecture build (including ARMv6)

# Stage 1: Builder for all architectures
FROM --platform=$BUILDPLATFORM python:3.11-slim AS builder

# Install cross-compilation dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    gcc-arm-linux-gnueabi \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Rust with proper target
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal
ENV PATH="/root/.cargo/bin:$PATH"
RUN rustup target add arm-unknown-linux-gnueabihf

WORKDIR /app
COPY . .

# Install Python dependencies
RUN pip install -r requirements.txt --global-option="--force-pi"

# Stage 2: Runtime image
FROM --platform=$TARGETPLATFORM python:3.11-slim

WORKDIR /app

# Copy only necessary files from builder
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=builder /app /app

EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
