# Use an official Python image as base
FROM python:3.9-slim

# Set working directory inside container
WORKDIR /app1

# Copy all files into container
COPY . /app1

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
