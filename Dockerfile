# pull the s2i-minimal-py38-notebook image
FROM quay.io/thoth-station/s2i-lab-elyra:latest
# switch to root user
USER 0 
# install mesa-libGL
RUN yum install -y mesa-libGL
