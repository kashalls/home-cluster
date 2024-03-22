## Directory

`📁 apps`

Contains the deployments of cluster-specific applications and their respective configurations.

The general format of this follows this roughly: kubernetes/apps/{{ cluster }}/{{ namespace }}/{{ application }}

Some applications are grouped under a namespace because they provide similar functionality.

`📁 bootstrap`

This folder contains the initial install of flux. After applying it, its pretty much not needed.

`📁 flux`

This folder contains global and cluster specifics for flux. After bootstraping, these files are applied so flux can manage the apps folder.

`📁 repositories`

This folder contains types of helm repositories that are used throughout my clusters.
