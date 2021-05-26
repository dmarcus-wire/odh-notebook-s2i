# pull the s2i-minimal-py38-notebook image
FROM minimal-gpu
# switch to root user
USER 0 
# install mesa-libGL
RUN yum install -y mesa-libGL
