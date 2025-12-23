inherit core-image
EXTRA_IMAGE_FEATURES += "debug-tweaks ssh-server-openssh"
IMAGE_INSTALL += " \
    wireless-regdb-static \
    connman \
    connman-client \
    "

IMAGE_INSTALL:append = " wifi-provisioning"

