#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.77.1/g' package/base-files/files/bin/config_generate

svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/other/luci-app-openclash
svn co https://github.com/kongfl888/luci-app-adguardhome/trunk/ package/other/luci-app-adguardhome
svn co https://github.com/QiuSimons/openwrt-mos/trunk/luci-app-mosdns package/other/luci-app-mosdns
svn co https://github.com/QiuSimons/openwrt-mos/trunk/mosdns package/other/mosdns
