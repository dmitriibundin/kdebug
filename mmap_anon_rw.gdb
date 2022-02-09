source files.gdb
file /usr/lib/debug/lib/modules/5.16.0-rc8-custom/vmlinux
directory /ksource/linux
target remote localhost:1234

#Initial entry point to the mmap system call
b ksys_mmap_pgoff
b do_mmap

#Find unmapped vma
b vm_unmapped_area

#Do the mmap after unmapped area was found
b mmap_region

set scheduler-locking step

c
