# pull the s2i-minimal-py38-notebook image
# this name:tag comes from the ODH deployment (specifically, the cuda-11.0.3 overlay)
FROM minimal-gpu:py3.8-cuda-11.0.3
# switch root
USER root
# install mesa-libGL
RUN yum install -y mesa-libGL
# copy source to /tmp
COPY . /tmp/src
# recursively set permissions
RUN chown -R 1001 /tmp/src && \
    chgrp -R 0 /tmp/src && \
    chmod -R g+w /tmp/src && \
    mv .s2i/bin /tmp/scripts
# switch to user 1001
USER 1001
# run the assemble script
RUN /tmp/scripts/assemble
# run command on if local, else ocp runs from jupyter spawner
CMD /tmp/scripts/run

