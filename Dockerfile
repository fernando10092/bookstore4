# Use Python 3.12 slim image as base
FROM python:3.12-slim as python-base

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VERSION=1.7.1 \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1 \
    PYSETUP_PATH="/opt/pysetup" \
    VENV_PATH="/opt/pysetup/.venv"

ENV PATH="$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"

# Install system dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    build-essential \
    libpq-dev \
    gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Set working directory for Poetry setup
WORKDIR $PYSETUP_PATH

# Copy Poetry files
COPY poetry.lock pyproject.toml ./

# Install dependencies
RUN poetry install --no-dev

# Set app directory
WORKDIR /app

# Copy application code
COPY . .

# Expose port
EXPOSE 8000

# Command to run the application
CMD ["sh", "-c", "python wait_for_db.py && python manage.py migrate && exec python manage.py runserver 0.0.0.0:8000"]
