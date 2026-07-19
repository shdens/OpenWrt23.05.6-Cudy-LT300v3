#!/bin/bash

# 1. Исправляем опечатку "Gang" в патче DTS, если она там осталась
sed -i 's/Gang_ACTIVE_LOW/GPIO_ACTIVE_LOW/g' target/linux/ramips/dts/mt7628an_cudy_lt300-v3.dts

# 2. Модифицируем файл сборки image/mt76x8.mk
# Мы временно очищаем список TARGET_DEVICES, чтобы система вообще не знала про Alfa Network
sed -i 's/TARGET_DEVICES +=/# TARGET_DEVICES +=/g' target/linux/ramips/image/mt76x8.mk

# 3. Принудительно возвращаем в список сборки ТОЛЬКО ваш Cudy
echo "TARGET_DEVICES += cudy_lt300-v3" >> target/linux/ramips/image/mt76x8.mk

# 4. Прописываем конфигурацию в .config
echo 'CONFIG_TARGET_ramips=y' > .config
echo 'CONFIG_TARGET_ramips_mt76x8=y' >> .config
echo 'CONFIG_TARGET_ramips_mt76x8_DEVICE_cudy_lt300-v3=y' >> .config
echo 'CONFIG_TARGET_MULTI_PROFILE=n' >> .config
