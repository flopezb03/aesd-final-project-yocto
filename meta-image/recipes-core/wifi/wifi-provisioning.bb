SUMMARY = "Wi-Fi provisioning for ConnMan"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://settings file://wifi_provisioning.config"

S = "${WORKDIR}"

do_install() {
    install -d ${D}/var/lib/connman
    install -m 600 ${S}/settings ${D}/var/lib/connman/settings
    install -m 600 ${S}/wifi_provisioning.config ${D}/var/lib/connman/wifi_provisioning.config
}

FILES:${PN} += "/var/lib/connman"
