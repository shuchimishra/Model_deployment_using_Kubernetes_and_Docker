# lightweight python
FROM python:3.7-slim

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

# Install dependencies
# RUN pip install --upgrade pip
# RUN pip install tensorflow==2.11.0 tensorflow-datasets Flask gunicorn healthcheck google-cloud-logging
RUN pip install tensorflow==2.1.0 tensorflow-datasets==2.1.0 Flask==1.1.1 gunicorn==20.0.4 healthcheck==1.3.3 google-cloud-logging==1.15.0

# Run the flask service on container startup
# Note worker does not share memory but threads share memory;
# which means model will be loaded multiple time within each worker
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 SAGunicorn:app
