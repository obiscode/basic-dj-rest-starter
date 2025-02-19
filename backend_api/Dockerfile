FROM python:3.10-slim-bullseye

# Set the working directory
WORKDIR /usr/src/backend_api

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1  

RUN apt-get update && apt-get install -y netcat

COPY ./requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt 

COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' /usr/src/backend_api/entrypoint.sh
RUN chmod +x /usr/src/backend_api/entrypoint.sh 

# Copy the current directory contents into the container at /usr/src/backend_api
COPY . .

# Run the entrypoint.sh script
ENTRYPOINT [ "/usr/src/backend_api/entrypoint.sh" ]