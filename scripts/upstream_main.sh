#!/bin/bash

# Packages from ImmortalWrt
# LuCI
git clone --depth 1 --filter=blob:none --sparse https://github.com/immortalwrt/luci immortalwrt-luci
cd immortalwrt-luci
git sparse-checkout set applications/luci-app-ramfree applications/luci-app-dufs applications/luci-app-rclone applications/luci-app-usb-printer applications/luci-app-wechatpush
mv applications/* ../
cd ../
rm -rf immortalwrt-luci

# Packages
git clone --depth 1 --filter=blob:none --sparse https://github.com/immortalwrt/packages immortalwrt-packages
cd immortalwrt-packages
git sparse-checkout set net/dufs dufs/rclone dufs/rclone-ng dufs/rclone-webui-react
mv net/* ../
cd ../
rm -rf immortalwrt-packages

# ADGuardHome
git clone --depth 1 https://github.com/chenmozhijin/luci-app-adguardhome

# AutoUpdate
git clone --depth 1 https://github.com/Hyy2001X/AutoBuild-Packages
cd AutoBuild-Packages
for i in "autoupdate" "luci-app-autoupdate"; do \
  mv "$i" .. ; \
done
cd .. && rm -rf AutoBuild-Packages

# CloudDreve
git clone --depth 1 https://github.com/kiddin9/luci-app-cloudreve

# CPUFreq
git clone --depth 1 https://github.com/jjm2473/openwrt-apps
cd openwrt-apps
for i in "luci-app-cpufreq"; do \
  mv "$i" .. ; \
done
cd .. && rm -rf openwrt-apps

# FanControl
git clone --depth 1 https://github.com/JiaY-shi/fancontrol
cd fancontrol
for i in "fancontrol" "luci-app-fancontrol"; do \
  mv "$i" .. ; \
done
cd .. && rm -rf fancontrol


# Tailscale
# git clone --depth 1 https://github.com/Carseason/openwrt-tailscale
# mv ./openwrt-tailscale/luci-app-tailscaler ./
# rm -rf openwrt-tailscale

# Theme
git clone --depth 1 https://github.com/kiddin9/luci-theme-edge

# Passwall2
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2/ ./luci-app-passwall2
mv ./luci-app-passwall2/luci-app-passwall2/* ./luci-app-passwall2/
rm -rf ./luci-app-passwall2/luci-app-passwall2/
sed -i 's/xray-core/sing-box/g' ./luci-app-passwall2/Makefile
git clone --depth 1 --branch main --filter=blob:none --sparse https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages
cd openwrt-passwall-packages && git sparse-checkout init --cone
for i in "tcping" "v2ray-geodata" "sing-box"; do \
  git sparse-checkout set "$i" && mv "$i" .. ; \
done
cd .. && rm -rf openwrt-passwall-packages

# Sirpdboy
git clone --depth 1 https://github.com/sirpdboy/luci-app-partexp
git clone --depth 1 https://github.com/sirpdboy/luci-app-advancedplus
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go ddns
mv ddns/*ddns-go  ./
rm -rf ddns
git clone --depth 1 https://github.com/sirpdboy/luci-app-netwizard

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
