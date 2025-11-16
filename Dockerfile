# 1. Base Image
# Use an official, lightweight Python image.
FROM python:3.10-slim

# 2. Set Working Directory
# Create a directory inside the container to hold our app.
WORKDIR /app

# 3. Copy requirements and install dependencies
# Copy the requirements file first to leverage Docker's build cache.
# If this file doesn't change, Docker won't re-install dependencies.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copy Application Code
# Copy the rest of your application's code into the /app directory.
COPY . .

# 5. Expose Port
# Tell Docker the container listens on port 5000 (the default Flask port).
EXPOSE 5000

# 6. Run Command
# Use gunicorn to run the app.
# - "app:app" means: In the file 'app.py', find the variable named 'app'.
# - "--bind 0.0.0.0:5000" means: Listen on port 5000 on all available network interfaces.
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]