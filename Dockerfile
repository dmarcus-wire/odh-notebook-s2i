# pull the s2i-minimal-py38-notebook image
# this name:tag comes from the ODH deployment (specifically, the cuda-11.0.3 overlay)
FROM minimal-gpu:py3.8-cuda-11.0.3
# switch root
USER root
# install mesa-libGL
RUN yum install -y mesa-libGL
# Copying in override assemble (pipfile install, extension, plugins, etc.)/run scripts
COPY .s2i/bin /tmp/scripts
# Copying whole project into source code
COPY . /tmp/src
# -R option to recursively change the ownership:group of an entire directory tree to the assemble user. Builder image must support chown command.
RUN chown -R 1001 /tmp/scripts /tmp/src
USER 1001
# as user 1001, runs the assemble
RUN /tmp/scripts/assemble
# will only run if local, if in ocp runs cmd from the spawner
CMD /tmp/scripts/run
