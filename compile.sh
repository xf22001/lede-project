#!/bin/bash

#================================================================
#   
#   
#   文件名称：compile.sh
#   创 建 者：肖飞
#   创建日期：2023年07月25日 星期二 10时13分54秒
#   修改日期：2024年04月26日 星期五 23时34分43秒
#   描    述：
#
#================================================================
function main() {
	rm -rf uploads

	./scripts/feeds update -a
	./scripts/feeds install -a

	cp -a default.config .config
	make defconfig
	#make menuconfig
	make clean
	make -j$(nproc)
	mkdir -p uploads/default
	cp -a ./bin/targets/ramips/mt7620 uploads/default/

	cp -a testing-kernel.config .config
	make defconfig
	#make menuconfig
	make clean
	make -j$(nproc)
	mkdir -p uploads/testing-kernel
	cp -a ./bin/targets/ramips/mt7620 uploads/testing-kernel/
}

main $@
