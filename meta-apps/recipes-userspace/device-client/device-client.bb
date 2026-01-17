LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "git://github.com/flopezb03/aesd-final-project-apps.git;protocol=https;branch=feature/device-client"

PV = "1.0+git${SRCPV}"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git/${BPN}"

FILES:${PN} += "${bindir}/telemetry-client"
FILES:${PN} += "${sysconfdir}/init.d/init-telemetry-client"

inherit update-rc.d
INITSCRIPT_PACKAGES = "${PN}"
INITSCRIPT_NAME:${PN} = "init-telemetry-client"

do_compile () {
	oe_runmake
}

do_install () {
	install -d ${D}${bindir}
	install -m 0755 ${S}/telemetry-client ${D}${bindir}/

    install -d ${D}${sysconfdir}/init.d
	install -m 0755 ${S}/init-telemetry-client ${D}${sysconfdir}/init.d/
}

