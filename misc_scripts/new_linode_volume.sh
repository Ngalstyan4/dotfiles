#!/bin/bash
mkfs.ext4 "/dev/disk/by-id/scsi-0Linode_Volume_huggingface-data"
mkdir "/mnt/huggingface-data"
mount "/dev/disk/by-id/scsi-0Linode_Volume_huggingface-data" "/mnt/huggingface-data"
echo '/dev/disk/by-id/scsi-0Linode_Volume_huggingface-data /mnt/huggingface-data ext4 defaults,noatime,nofail 0 2' >> /etc/fstab
