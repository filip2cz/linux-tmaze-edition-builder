#!/usr/bin/env bash
# shellcheck disable=SC2034

# Put name of your iso here
iso_name="linux-tmaze-edition"
iso_label="ARCH_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
# Put your name (and optionaly your website) here
iso_publisher="Filip Komárek <https://github.com/filip2cz/linux-tmaze-edition-builder>"
# Put description of your iso here
iso_application="Linux ISO image to run TMaze"
# Version of your iso: when you release second version of your iso, you will propably want to change it to v1.1 or v2.0 or whatever you want
echo "$iso_version" > tmaze.txt
# iso_version="1.15.2"
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
