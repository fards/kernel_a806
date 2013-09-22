
export TCHAIN=../../../prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi-

make ARCH=arm clean
make ARCH=arm CROSS_COMPILE=$TCHAIN fusion3_yuga_defconfig
make ARCH=arm CROSS_COMPILE=$TCHAIN -j 8

# Create new bootsplash
( cd _create_bootsplash && make clean ; make )

# add new kernel
cp arch/arm/boot/zImage ../../../device/sony/c6603/kernel 
# copy new bootsplash to device tree
cp _create_bootsplash/logo.rle ../../../device/sony/c6603/rootdir/logo.rle
# overwrite wlan driver of sony
cp ./drivers/staging/prima/wlan.ko  ../../../vendor/sony/c6603/proprietary/lib/modules/wlan.ko
