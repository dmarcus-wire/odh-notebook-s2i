# Modify ODH notebook with Python and OS Packages

## Objective:
1. Update any ODH project notebook image with python (ex. opencv-python) and os packages (ex. mesa-libGL)

## Assumptions:
1. 

`oc new-build https://github.com/dmarcus-wire/odh-notebook-s2i --name=opencv-notebook app=opencv-notebook`


oc edit is opencv-notebook and add this line to labels:
```
    opendatahub.io/notebook-image: 'true'
```

or cli route:
`oc add label...`



...
Installed products updated.

Installed:
  libXdamage-1.1.4-14.el8.x86_64        libXfixes-5.0.3-7.el8.x86_64
  libXxf86vm-1.1.4-9.el8.x86_64         libdrm-2.4.103-1.el8.x86_64
  libglvnd-1:1.3.2-1.el8.x86_64         libglvnd-glx-1:1.3.2-1.el8.x86_64
  libpciaccess-0.14-1.el8.x86_64        libxshmfence-1.3-2.el8.x86_64
  mesa-libGL-20.3.3-2.el8.x86_64        mesa-libglapi-20.3.3-2.el8.x86_64

Complete!
--> bc2a31c86c0
STEP 4: COPY .s2i/bin /tmp/scripts
--> 822b0969618
STEP 5: COPY . /tmp/src
--> 739bc9aab73
STEP 6: RUN chown -R 1001:0 /tmp/scripts /tmp/src
--> 3af9ebb4ce0
STEP 7: USER 1001
--> 1c463d951c5
STEP 8: RUN /tmp/scripts/assemble
/bin/sh: /tmp/scripts/assemble: Permission denied
error: build error: error building at STEP "RUN /tmp/scripts/assemble": error while running runtime: exit status 126