source files.gdb
file /usr/lib/debug/lib/modules/5.16.0-rc8-custom/vmlinux
directory /ksource/linux
target remote localhost:1234

#blk_finish_plug makes data to appear in the buffer at fs/iomap/direct-io.c:597
#b block/blk-mq-sched.c:213
#b __blk_mq_do_dispatch_sched

#Iterates over the actual iter till the end. This is what makes strange pointer to appear in the iov.iov_base
#b iov_iter_iovec_advance

#The main point at which the bio is added to the plug
#b blk_mq_submit_bio

#This is for tracing how requests is inserted into elevator queue
#b blk_mq_flush_plug_list
#b dd_insert_requests
set scheduler-locking step

#The actual driver entry point
b blk_mq_dispatch_rq_list
b scsi_queue_rq

#Initialize the scsi_cmnd
b sd_init_command

#Send SCSI command to a low-level ata driver
b ata_scsi_queuecmd

#SCSI callbacks
b scsi_done
b scsi_complete
