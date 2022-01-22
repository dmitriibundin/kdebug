define print_file_path_components
    set $dentry = $arg0->f_path->dentry
    set $parent_dentry = $dentry->d_parent
    p $dentry.d_iname
    while($parent_dentry != $dentry)
        set $dentry = $dentry->d_parent
        set $parent_dentry = $dentry->d_parent
        p $dentry.d_iname
    end
end

#Given an instance of struct file extract the device name
#
#@arg0 - A pointer to struct file
define file_device_name
    p $arg0->f_inode->i_sb->s_bdev.bd_device.kobj.name
end

#Using an instance of struct request extracts its struct bio's iov_base.
#
#This function is particularly unsafe since it relies on the fact 
#that callers MUST know what segments to go to exactly.
#
#@arg0 - A pointer to the struct request
#@arg1 - segment number to go back in the struct iov_iter instance
define file_rq_bio_iov_base_unsafe
    p (char *)(((struct iomap_dio *)($arg0->bio->bi_private))->submit.iter.iov - $arg1).iov_base
end
