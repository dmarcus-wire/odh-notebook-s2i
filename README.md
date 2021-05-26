# Modify ODH notebook with Python and OS Packages

## Objective:
1. Update any ODH project notebook image with python (ex. opencv-python) and os packages (ex. mesa-libGL)

## Assumptions:
1. 

`oc new-build https://github.com/dmarcus-wire/odh-notebook-s2i --name=opencv-notebook app=opencv-notebook`

`oc add label...`