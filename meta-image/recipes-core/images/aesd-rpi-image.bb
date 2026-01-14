inherit core-image
EXTRA_IMAGE_FEATURES += "debug-tweaks ssh-server-openssh"
IMAGE_INSTALL += " \
    wireless-regdb-static \
    connman \
    connman-client \
    "

IMAGE_INSTALL:append = " wifi-provisioning"

IMAGE_INSTALL:append = " ntp"
IMAGE_INSTALL:append = " ntp-utils"

IMAGE_INSTALL:append = " i2c-tools"
IMAGE_INSTALL:append = " device-telemetry"

