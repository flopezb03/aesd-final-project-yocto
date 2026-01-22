#!/bin/bash


# Default variables
TARGET="/dev/sda"
IMAGE="$(dirname "$(realpath "$0")")/build/tmp/deploy/images/raspberrypi3-64/aesd-rpi-image-raspberrypi3-64.sdimg"
AUTO_YES=false


# Parse script options
OPTS=$(getopt -o y --long target:,image: -n "$(basename $0)" -- "$@")

if [ $? -ne 0 ]; then
    exit 1
fi

eval set -- "$OPTS"

while true; do
    case "$1" in
        -y)
            AUTO_YES=true
            shift
            ;;
        --target)
            TARGET="$2"
            shift 2
            ;;
        --image)
            IMAGE="$2"
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Usage: $(basename $0) [--target TARGET] [--image IMAGE] [-y]"
            echo "  --target TARGET  Specify the target device (default: /dev/sda)"
            echo "  --image IMAGE    Specify the image file (default: build/tmp/deploy/images/raspberrypi3-64/aesd-rpi-image-raspberrypi3-64.sdimg)"
            echo "  -y               Automatically confirm actions"
            exit 1
            ;;
    esac
done


# Check if target device is valid
if [ ! -b "$TARGET" ]; then
    echo "Error: $TARGET does not exists or is not a block device"
    exit 1
fi


# Ask confirmation
if [ "$AUTO_YES" == false ]; then
    echo "WARNING: This will flash the image to $TARGET. Are you sure? (y/n)"
    read -r confirmation
    if [[ ! "$confirmation" =~ ^[Yy]$ ]]; then
        echo "Aborting."
        exit 1
  fi
fi

# Flash the image using bmaptool
echo "Flashing $IMAGE to $TARGET..."
sudo bmaptool copy "$IMAGE" "$TARGET"

if [ $? -eq 0 ]; then
  echo "Flashing completed successfully!"
else
  echo "Error during flashing."
  exit 1
fi


# Check if the device is mounted
MOUNTED=$(mount | grep "$TARGET")

if [ -n "$MOUNTED" ]; then
  sudo udisksctl unmount -b "$TARGET"
  if [ $? -eq 0 ]; then
    sudo udisksctl power-off -b "$TARGET"
    echo "$TARGET was ejected."
  else
    echo "Error unmounting $TARGET."
    exit 1
  fi
else
  # If it is not mounted, try to power off the device directly
  sudo udisksctl power-off -b "$TARGET"
  echo "$TARGET was ejected."
fi




