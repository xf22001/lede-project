#!/bin/bash

#================================================================
#   
#   
#   文件名称：compile.sh
#   创 建 者：肖飞
#   创建日期：2023年07月25日 星期二 10时13分54秒
#   修改日期：2024年04月26日 星期五 11时47分11秒
#   描    述：
#
#================================================================
function main() {
	./scripts/feeds update -a
	./scripts/feeds install -a
	make defconfig
	#make menuconfig
	make clean
	make -j4
}

main $@
