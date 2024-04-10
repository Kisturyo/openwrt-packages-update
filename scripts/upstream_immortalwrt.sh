#!/bin/bash

# Packages from ImmortalWrt

# Tailscale
git clone --depth 1 https://github.com/Carseason/openwrt-tailscale
mv ./openwrt-tailscale/luci-app-tailscaler ./
rm -rf openwrt-tailscale

# luci-theme-argon
git clone --depth 1 https://github.com/GinkoCai/luci-theme-argon
git clone --depth 1 https://github.com/kiddin9/luci-theme-edge

# passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall/ ./luci-app-passwall
mv ./luci-app-passwall/luci-app-passwall/* ./luci-app-passwall/
rm -rf ./luci-app-passwall/luci-app-passwall/
git clone --depth 1 --branch main --filter=blob:none --sparse https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages
cd openwrt-passwall-packages && git sparse-checkout init --cone
for i in "xray-core" "sing-box"; do \
  git sparse-checkout set "$i" && mv "$i" .. ; \
done
cd .. && rm -rf openwrt-passwall-packages

# Sirpdboy
git clone --depth 1 https://github.com/sirpdboy/luci-app-partexp
git clone --depth 1 https://github.com/sirpdboy/luci-app-advancedplus
git clone --depth 1 https://github.com/sirpdboy/netspeedtest.git
mv netspeedtest/homebox netspeedtest/luci-app-netspeedtest ./
rm -rf netspeedtest
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go ddns
mv ddns/*ddns-go  ./
rm -rf ddns
git clone --depth 1 https://github.com/sirpdboy/luci-app-netwizard
git clone --depth 1 https://github.com/sirpdboy/luci-theme-kucat
git clone --depth 1 https://github.com/selfcan/luci-app-homebox

# WolPlus
git clone --depth 1 https://github.com/animegasan/luci-app-wolplus

# 修改 luci.mk 文件路径
# find ./ -iname Makefile -exec sed -i 's#../../luci.mk#$(TOPDIR)/feeds/luci/luci.mk#g' {} +

# 统一清理
find ./*/ -name '.svn' | xargs rm -rf
find ./*/ -name '.git' | xargs rm -rf
find ./*/ -name '.github' | xargs rm -rf
find ./*/ -name '.gitattributes' | xargs rm -rf
find ./*/ -name '.gitignore' | xargs rm -rf
find ./*/ -name 'README*.md' | xargs rm -r

exit 0
