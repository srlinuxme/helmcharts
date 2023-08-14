# v1.5.0

## Important
- Removed redis from this chart as it's osbolete. You need to install a redis server aside! See README for details.

## Features:
- Compatibility with peertube v4.3.0


# v1.4.0

## Feature
- Upgrade Ingress template for k8s 1.19+ compatibility
- Remove fixed database suffix from deployment, please use production.yml to configure if default "_prod" is not sufficient

# v1.3.0

## Feature
- Bump to peertube v4.0 by default. Warn if you are upgrading for 3.4, see release note for post maj script: https://github.com/Chocobozzz/PeerTube/releases/tag/v4.0.0

# v1.2.1

## Fix
 - Adjust initialDelaySecond for startupProbe to avoid waiting 5min even if the instance starts quickly
 - Adjust startupProbe port to use 9000 instead of http

# v1.2.0

## Features
 - Compatibility with helm 3 and k8s 1.16+
 - Now use StartupProbe to enable very long start when updating Peertube and running upgrade scripts

# v1.1.2

## Fixes
 - Update compatibility to Peertube v2.3.0
 - Remove deprecated env variables for docker

# v1.1.1

Ensure compatibility with Peertube v2.2.0 by removing the PEERTUBE_TRUST_PROXY env variable that does not exist anymore.

Is you used it, configure your production.yml instead for better reliability.

# v1.1.0

## Features

Add a nginx sidecar to use the official Peertube optimisations for Nginx (Fix #2)

# v1.0.2

## Breaking changes

The option initcontainer is now renamed chowncontainer as it fit better to its usage.

## Fixes

 - Fix issue #3 to avoid breaking Peertube upgrade by using 2 initContainers

# v1.0.1

Now use Peertube v2.1.0-buster as default

# v1.0.0

*Initial release*

##Features

 - Deploy Peertube in kubernetes
 - Deploy redis server to be used by Peertube
 - Allow to enable usual docker "chown" to speed up startup through InitContainer


