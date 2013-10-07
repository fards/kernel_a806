
export TCHAIN=../../../prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi-

#make ARCH=arm clean
make ARCH=arm CROSS_COMPILE=$TCHAIN fusion3_yuga_defconfig
make ARCH=arm CROSS_COMPILE=$TCHAIN -j 4

# Create new bootsplash
( cd _create_bootsplash && make clean ; make )

# add new kernel
cp arch/arm/boot/zImage ../../boot
# copy new bootsplash to device tree
cp _create_bootsplash/logo.rle ../../logo.rle
# overwrite wlan driver of sony
#cp ./drivers/staging/prima/wlan.ko  ../../vendor/sony
#Run mkbootimg script for the terminally lazy
cd ../../boot/
./makeit.sh