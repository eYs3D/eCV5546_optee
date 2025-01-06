echo "##### build optee_os  #####"
cd optee_os

make -f ecv5546.mk

cd ..

echo "##### build optee_client #####"
cd optee_client
make  WITH_TEEACL=0 CROSS_COMPILE=$2
if [ $? -eq 0 ]; then 
	echo "copy optee_client out file to rootfs"
	if [ ! -d ../../linux/rootfs/initramfs/disk/lib64 ]; then
		cp out/export/usr/lib/libteec.so.1 ../../linux/rootfs/initramfs/disk/lib/
	else
		cp out/export/usr/lib/libteec.so.1 ../../linux/rootfs/initramfs/disk/lib64/
	fi
	cp out/export/usr/sbin/tee-supplicant ../../linux/rootfs/initramfs/disk/bin/
fi
cd ..

echo "##### build optee_example #####"
cd optee_examples/hello_world
make  CROSS_COMPILE=$2
if [ $? -eq 0 ]; then 
	echo "copy optee_example out file to rootfs"
	 cp host/optee_example_hello_world ../../../linux/rootfs/initramfs/disk/bin/
	 if [ ! -d ../../../linux/rootfs/initramfs/disk/lib/optee_armtz ];then
		mkdir ../../../linux/rootfs/initramfs/disk/lib/optee_armtz
	 fi
	 cp ta/8aaaf200-2450-11e4-abe2-0002a5d5c51b.ta ../../../linux/rootfs/initramfs/disk/lib/optee_armtz
fi
cd ../..
