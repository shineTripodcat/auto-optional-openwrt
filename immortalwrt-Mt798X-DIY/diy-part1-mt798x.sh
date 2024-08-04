#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

git clone https://github.com/openwrt/openwrt
git clone https://github.com/immortalwrt/luci

mv openwrt/package/utils/ucode package/utils/
mv luci/contrib/package/ucode-mod-lua feeds/luci/contrib/package/

rm -rf openwrt luci

# Add a feed source
echo 'src-git passwall_luci https://github.com/xiaorouji/openwrt-passwall.git' >>feeds.conf.default
echo 'src-git passwall_package https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default
#echo 'src-git luci_lua_runtime https://github.com/openwrt/luci/tree/master/modules/luci-lua-runtime' >>feeds.conf.default
echo 'src-git luci_lua_runtime https://github.com/shineTripodcat/runtime' >>feeds.conf.default
#sed -i '2d' feeds.conf.default
#sed -i '2i src-git luci https://github.com/shineTripodcat/luci.git;openwrt-21.02' feeds.conf.default


# 修改版本为编译日期
#date_version=$(date +"%y.%m.%d")
#orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
#sed -i "s/${orig_version}/R${date_version} by go-laoji/g" package/lean/default-settings/files/zzz-default-settings
