#!/usr/bin/env bash
# shellcheck disable=SC2034

# Put name of your iso here
iso_name="name-of-your-iso"
iso_label="ARCH_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
# Put your name (and optionaly your website) here
iso_publisher="Your Name <https://example.com>"
# Put description of your iso here
iso_application="This is description of this iso"
# Version of your iso: when you release second version of your iso, you will propably want to change it to v1.1 or v2.0 or whatever you want
iso_version="v1.0"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.grub.esp' 'uefi-x64.grub.esp'
           'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="erofs"
airootfs_image_tool_options=('-zlzma,109' -E 'ztailpacking,fragments,dedupe')
bootstrap_tarball_compression=(zstd -c -T0 --long -19)
file_permissions=(
  ["/etc/shadow"]="0:0:400"
)
