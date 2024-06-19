# lightweight python
FROM python:3.7-slim

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

# Install dependencies
RUN pip install tensorflow==2.1.0 tensorflow-datasets Flask gunicorn healthcheck google-cloud-logging

# Run the flask service on container startup
# Note worker does not share memory but threads share memory;
# which means model will be loaded multiple time within each worker
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 SAGunicorns:app
