 # AESD Final Project Yocto

This repository contains the __Yocto__ Project used to build a custom Linux image for __Raspberry Pi 3B+__, integrated with __Mender__ to support OTA software updates.

The project defines the layers required to build the system:
- __meta-apps__: integrates the device applications providing recipes required to build and install them into the final image.
- __meta-image__: defines the system image, including base system configuration, __NTP__ time synchronization, and __Wi-Fi__ conectivity setup.

For a detailed description of the project, please refer to the [Wiki](https://github.com/flopezb03/aesd-final-project-yocto/wiki)

---

Este repositorio contiene el proyecto **Yocto** utilizado para generar una imagen Linux personalizada para **Raspberry Pi 3B+**, integrada con **Mender** para actualizaciones OTA.

El proyecto define las capas necesarias para la construcción del sistema:
- **meta-apps**: integra las aplicaciones del dispositivo proporcionando las recetas necesarias para su compilación e instalación en la imagen final.
- **meta-image**: define la imagen del sistema, incluyendo la configuración del sistema base, la sincronización horaria mediante **NTP** y la preparación de la conectividad **Wi-Fi**.

Para una descripción detallada del proyecto, consulta la [Wiki](https://github.com/flopezb03/aesd-final-project-yocto/wiki).
