FROM python:3.8-slim

# Create a directory for the app
WORKDIR /app

# Install dependencies
RUN pip install --upgrade torch transformers flask flask_restful flask_limiter gunicorn

# Copy the app code
COPY . /app


# Expose the default port for the Flask app
EXPOSE 5001

# Set the default command to run the Flask app "timeout" is important to let the API respond and download models initally before the process is killed.
CMD ["gunicorn", "main:app", "-b", "0.0.0.0:5001", "--timeout", "99999"]
