#!/bin/bash

for e in $(ls -d luci-*/po); do
	if [[ -d $e/zh-cn ]]; then
		rm -rf $e/zh_Hans
		mv $e/zh-cn $e/zh_Hans
	elif [[ -d $e/zh-Hans ]]; then
	    rm -rf $e/zh_cn
	fi
done

for e in $(ls -d luci-*/po); do
	if [[ -d $e/zh-tw ]]; then
		rm -rf $e/zh_Hant
		mv $e/zh-tw $e/zh_Hant
	elif [[ -d $e/zh-Hant ]]; then
	    rm -rf $e/zh_tw
	fi
done
