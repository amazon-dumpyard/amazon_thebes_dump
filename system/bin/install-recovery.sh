#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery:6379520:9fb468a8e3555811bfb0e546ae4fbc0473f32da4; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/by-name/boot:5916672:b57b6b9312cf62ca5d3c176b715fd5c8ef4c8b0d EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery 9fb468a8e3555811bfb0e546ae4fbc0473f32da4 6379520 b57b6b9312cf62ca5d3c176b715fd5c8ef4c8b0d:/system/recovery-from-boot.p && echo "
Installing new recovery image: succeeded
" >> /cache/recovery/log || echo "
Installing new recovery image: failed
" >> /cache/recovery/log
else
  log -t recovery "Recovery image already installed"
fi
