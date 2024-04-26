#!/bin/bash

#================================================================
#   
#   
#   文件名称：compile.sh
#   创 建 者：肖飞
#   创建日期：2023年07月25日 星期二 10时13分54秒
#   修改日期：2024年04月26日 星期五 13时46分00秒
#   描    述：
#
#================================================================
function main() {
	./scripts/feeds update -a
	./scripts/feeds install -a

	cp -a xiaofei.config .config
	make defconfig
	#make menuconfig
	make clean
	make -j$(nproc)
	mkdir -p uploads/xiaofei
	cp -a ./bin/targets/ramips/mt7620 uploads/xiaofei/

	cp -a xiaofei-testing-kernel.config .config
	make defconfig
	#make menuconfig
	make clean
	make -j$(nproc)
	mkdir -p uploads/xiaofei-testing-kernel.config
	cp -a ./bin/targets/ramips/mt7620 uploads/xiaofei-testing-kernel.config/
}

main $@
