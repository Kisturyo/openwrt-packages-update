#!/bin/bash

for e in $(ls -d luci-*/po); do
	if [ -h $e/zh-cn ]; then
		rm -rf $e/zh-cn
	elif [[ -d $e/zh-cn ]]; then
		rm -rf $e/zh_Hans
		mv $e/zh-cn $e/zh_Hans
	fi
done

for e in $(ls -d luci-*/po); do
	if [ -h $e/zh-tw ]; then
		rm -rf $e/zh-tw
	elif [[ -d $e/zh-tw ]]; then
		rm -rf $e/zh_Hant
		mv $e/zh-tw $e/zh_Hant
	fi
done

find ./ -iname Makefile -exec sed -i 's#../../luci.mk#$(TOPDIR)/feeds/luci/luci.mk#g' {} +
find ./ -iname Makefile -exec sed -i 's#../../lang/golang/golang-package.mk#$(TOPDIR)/feeds/packages/lang/golang/golang-package.mk#g' {} +
#find ./ -iname Makefile