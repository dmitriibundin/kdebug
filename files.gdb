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

define file_device_name
    p $arg0->f_inode->i_sb->s_bdev.bd_device.kobj.name
end
