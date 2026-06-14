.PHONY: initramfs run

initramfs:
	cd initramfs && \
	chmod +x init && \
	find . -print0 | cpio --null -ov --format=newc | gzip -9 > ../initrd.img

run: initramfs
	qemu-system-x86_64 \
    -kernel linux-stable/arch/x86_64/boot/bzImage \
    -initrd initrd.img \
    -nographic \
    -append "console=ttyS0"


