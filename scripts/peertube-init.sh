#!/bin/sh

# Populate config directory
if [ -z "$(ls -A /config)" ]; then
    cp /app/support/docker/production/config/* /config
fi

# Always copy default and custom env configuration file, in cases new keys were added
cp /app/config/default.yaml /config
cp /app/support/docker/production/config/custom-environment-variables.yaml /config
# Patch user after the cp
find /config ! -user peertube -exec chown peertube:peertube {} \;

# Prepare assets for the Nginx sidecar
cp -r /app/client/dist/* /assets/

exit 0