# Use an official Python base image
FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Copy files into container
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# Expose port to the host
# EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
