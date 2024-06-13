# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /usr/src/app

# Install system dependencies
RUN apt-get update && apt-get install -y git


# Install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app
RUN pip install -r requirements.txt

COPY ./entrypoint.sh  /usr/src/app/entrypoint.sh

RUN chmod +x /usr/src/app/entrypoint.sh


# Copy project
COPY .  /usr/src/app

# Expose port
EXPOSE 8001

# Run the application:
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]