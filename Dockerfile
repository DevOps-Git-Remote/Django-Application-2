FROM ubuntu:20.04

# Set working directory
WORKDIR /app

# Install required system packages
RUN apt update -y && apt install -y \
    python3-pip \
    python3-venv \
    python3-dev \
    bash \
    libpq-dev && apt clean

# Create a directory for your project
RUN mkdir /app/myproject
WORKDIR /app/myproject

# Copy the Django project (this assumes you have a requirements.txt in your project directory)
COPY . /app/myproject/

# Create a virtual environment for your project
RUN python3 -m venv myenv

# Install project dependencies within the virtual environment
RUN ./myenv/bin/pip install --upgrade pip
RUN ./myenv/bin/pip install -r /app/myproject/requirements.txt

# Expose port 8000 for Django
EXPOSE 8000

# Set the default command to run the Django development server
CMD ["bash", "-c", "source myenv/bin/activate && python3 manage.py runserver 0.0.0.0:8000"]
