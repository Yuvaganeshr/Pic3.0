# Use the official Python image from Docker Hub
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Copy all files into the container
COPY . /app

# Upgrade pip and install dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose port 8080
ENV PORT 8080

# Run the Flask app
CMD ["gunicorn", "-b", "0.0.0.0:8080", "--workers=1", "--threads=8", "--timeout=0", "main:app"]
