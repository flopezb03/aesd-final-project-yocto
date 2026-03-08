# Recipe created by recipetool
# This is the basis of a recipe and may need further editing in order to be fully functional.
# (Feel free to remove these comments when editing.)

# Unable to find any files that looked like license statements. Check the accompanying
# documentation and source headers and set LICENSE and LIC_FILES_CHKSUM accordingly.
#
# NOTE: LICENSE is being set to "CLOSED" to allow you to at least start building - if
# this is not accurate with respect to the licensing of the software being built (it
# will not be in most cases) you must specify the correct value before using this
# recipe for anything other than initial testing/development!
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

SRC_URI = "git://git@github.com/flopezb03/aesd-final-project-apps.git;protocol=ssh;branch=feature/driver-led"

# Modify these as desired
PV = "1.0+git${SRCPV}"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git/${BPN}"

inherit module

EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"

inherit update-rc.d
INITSCRIPT_NAME:${PN} = "rgbled-init"
INITSCRIPT_PACKAGES = "${PN}"

do_install:append() {
    install -d ${D}${bindir}
    install -m 0755 ${S}/rgbled_load ${D}${bindir}/
    install -m 0755 ${S}/rgbled_unload ${D}${bindir}/

    install -d ${D}${sysconfdir}/init.d
    install -m 0755 ${S}/rgbled-init ${D}${sysconfdir}/init.d/
}

FILES:${PN} += "${bindir}/rgbled_load"
FILES:${PN} += "${bindir}/rgbled_unload"
FILES:${PN} += "${sysconfdir}/init.d/rgbled-init"