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
svn co https://github.com/QiuSimons/openwrt-mos/trunk/ package/other/openwrt-mos

mv ${GITHUB_WORKSPACE}/pkg/* package/other/
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/openwrt-fullconenat package/other/openwrt-fullconenat

svn co https://github.com/coolsnowwolf/lede/trunk/tools/ucl ${GITHUB_WORKSPACE}/openwrt/tools/ucl
svn co https://github.com/coolsnowwolf/lede/trunk/tools/upx ${GITHUB_WORKSPACE}/openwrt/tools/upx
sed -i '44 a$(curdir)/upx/compile := $(curdir)/ucl/compile' ${GITHUB_WORKSPACE}/openwrt/tools/Makefile
sed -i 's/sstrip xxd/sstrip upx ucl xxd/g' ${GITHUB_WORKSPACE}/openwrt/tools/Makefile


#sed -i 's/syn_flood/synflood_protect/g' package/network/config/firewall/files/firewall.config
#rm -rf tools/Makefile
#mv ${GITHUB_WORKSPACE}/tools/* tools/
rm -rf feeds/packages/net/nginx-util/files/nginx.config
mv ${GITHUB_WORKSPACE}/nginx.config feeds/packages/net/nginx-util/files/
