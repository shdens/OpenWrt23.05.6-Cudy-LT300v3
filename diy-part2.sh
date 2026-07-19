#!/bin/bash
# Принудительно задаем целевую платформу MediaTek MT76x8
echo 'CONFIG_TARGET_ramips=y' >> .config
echo 'CONFIG_TARGET_ramips_mt76x8=y' >> .config

# Жестко прописываем сборку только для вашего Cudy LT300 v3 из патча
echo 'CONFIG_TARGET_ramips_mt76x8_DEVICE_cudy_lt300-v3=y' >> .config

# Отключаем генерацию образов для всех остальных устройств платформы
echo 'CONFIG_TARGET_MULTI_PROFILE=n' >> .config
