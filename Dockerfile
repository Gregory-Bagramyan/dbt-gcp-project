# Use a lightweight Python image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Install dbt
RUN pip install --no-cache-dir \
    dbt-core==1.10.3 \
    dbt-bigquery==1.10.3

# Install dbt dependencies
RUN dbt deps

# Copy project files to the container
COPY . /app

# Set environment variables for dbt
ENV DBT_PROFILES_DIR=/app

# Specify the entrypoint script. These are the commands that cloud run job will execute on default
ENTRYPOINT ["sh", "-c", "dbt seed && dbt build"]
