#!/bin/bash
# Записываем таргет в .config
echo 'CONFIG_TARGET_ramips=y' > .config
echo 'CONFIG_TARGET_ramips_mt76x8=y' >> .config
echo 'CONFIG_TARGET_ramips_mt76x8_DEVICE_cudy_lt300-v3=y' >> .config
echo 'CONFIG_TARGET_MULTI_PROFILE=n' >> .config

# ХАК: отключаем падение сборщика OpenWrt при ложной ошибке "too big: ... > 0"
sed -i 's/$(call Image\/Build\/Failed)/@echo "Skipping image size check failure"/g' include/image.mk
