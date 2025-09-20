# ========================================
# 🔮 FortuneAI FastAPI Dockerfile
# ========================================

# Stage 1: Base Python environment
FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    POETRY_HOME='/usr/local'

# Install system dependencies
RUN apt-get update && apt-get install -y

# Create app directory
WORKDIR /Fortune

# Copy dependency files
COPY . .

# Install Poetry
RUN pip install poetry

# Install dependencies
RUN poetry install

# Expose port
EXPOSE 8000

# Run the application
CMD ["poetry", "run", "fastapi", "run", "app/main.py"]

