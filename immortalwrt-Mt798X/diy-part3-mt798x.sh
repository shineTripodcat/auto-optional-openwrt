#!/bin/bash
#
# File name: diy-part3.sh
# Description: OpenWrt DIY script part 3 (After Update feeds)
#



# 删除现有的 luci-app-passwall 软件包
rm -rf feeds/luci/applications/luci-app-passwall

# 克隆新的 luci-app-passwall 软件包
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
git clone --depth=1 https://github.com/sbwml/luci-app-mosdns -b v5 feeds/packages/mosdns

# 移动克隆的文件到正确的目录
#mv package/luci-app-passwall/luci-app-passwall feeds/luci/applications/

# 删除临时克隆目录
#rm -rf package/luci-app-passwall
# 删除 /feeds/passwall_package/sing-box 目录
rm -rf feeds/passwall_package/sing-box

./scripts/feeds update -a
