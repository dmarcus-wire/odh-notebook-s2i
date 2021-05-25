# pull the s2i-minimal-py38-notebook image
FROM quay.io/thoth-station/s2i-minimal-py38-notebook:latest
# switch to root user
USER 0 
# install mesa-libGL
RUN yum install -y mesa-libGL
# leave root
USER 1001
