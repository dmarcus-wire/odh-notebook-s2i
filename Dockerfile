# pull the s2i-minimal-py38-notebook image
FROM quay.io/thoth-station/s2i-minimal-py38-notebook:latest
# set labels
LABEL name="s2i-opencv-py38-notebook:latest" \
      summary="Minimal Jupyter Notebook Source-to-Image for Python 3.8 OpenCV applications." \
      description="Notebook image based on Source-to-Image.This image can be used in OpenDatahub JupterHub." \
      io.k8s.description="Notebook image based on Source-to-Image.This image can be used in OpenDatahub JupterHub." \
      io.k8s.display-name="S2I OpenCV Py38 Notebook" \
      io.openshift.expose-services="8888:http" \
      io.openshift.tags="python,python38" \
      authoritative-source-url="https://quay.io/thoth-station/s2i-minimal-py38-notebook" \
      io.openshift.s2i.build.commit.ref="master" \
      io.openshift.s2i.build.source-location="https://github/thoth-station/s2i-minimal-py38-notebook" \
      io.openshift.s2i.build.image="quay.io/thoth-station/s2i-thoth-ubi8-py38:v0.26.0"
# set environment variables
# thoth-station AI recommendation engine for libraries because packaging stacks efficiently is complex
ENV JUPYTER_ENABLE_LAB="true" \
    ENABLE_MICROPIPENV="1" \
    UPGRADE_PIP_TO_LATEST="1" \
    WEB_CONCURRENCY="1" \
    # THOTH_ADVISE - always use the recommended stack by Thoth (even if Pipfile.lock is present in the repo). Thoth advise provides recommendation for python stack directly during the build time.
    THOTH_ADVISE="0" \
    # THOTH_ERROR_FALLBACK - fallback to the Pipfile.lock present in the repository if the submitted Thoth analysis fails
    THOTH_ERROR_FALLBACK="1" \
    # THOTH_DRY_RUN - submit stack to Thoth’s recommendation engine but do not use the recommended Pipfile.lock file, use the Pipfile.lock file present in the repo instead
    THOTH_DRY_RUN="1" \
    # THOTH_PROVENANCE_CHECK is done against Pipenv and Pipenv.lock that are expected as an input AND only if the lock file is not comming from Thoth’s recommendation engine (otherwise the stack has already verified provenance).
    THOTH_PROVENANCE_CHECK="0"
    # talks to thoth backend
    THAMOS_DEBUG="0" \
    THAMOS_VERBOSE="1" \

# switch to root user
USER 0 
# install mesa-libGL
RUN yum install -y mesa-libGL
