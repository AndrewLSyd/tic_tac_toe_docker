# base image
FROM ubuntu:18.04

# set up ubuntu
RUN apt-get update && apt-get install -y \
    software-properties-common
	
RUN add-apt-repository universe

# install Python and pip
RUN apt-get update && apt-get install -y \
    python3.7 \
    python3-pip

# copy everything in the current working directory to / in the container
COPY . .

# install required Python packages from requirements file
RUN pip3 install -r requirements.txt

# start Python app!
CMD ["python3", "entry_point.py"]

# note issue
# https://stackoverflow.com/questions/28668180/cant-install-pip-packages-inside-a-docker-container-with-ubuntu
