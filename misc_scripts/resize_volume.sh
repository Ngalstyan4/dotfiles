#!/bin/bash
VOL=/dev/disk/by-id/scsi-0Linode_Volume_huggingface-data
MNT=/mnt/huggingface-data

 sudo umount  e2fsck -f  $VOL
 sudo e2fsck -f  $VOL
 sudo resize2fs  $VOL
 sudo mount $VOL $MNT
