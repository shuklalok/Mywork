def kill_rke2_process_tree(process_id):
    """Kills the rke2 process tree.

    Args:
        process_id (str ot int): process id of rke2
    """
    try:
        # chroot
        workdir, rootfd = chroot.chroot_entry(global_vars.HOSTPATH)
        child_pid_command = f"ps -opid --no-headers --ppid {process_id}"
        LOGGER.debug("Command for rke2 child process IDs: %s", child_pid_command)
        child_pids_output = ce.execute(child_pid_command)
        child_pids = child_pids_output.split()
        chroot.chroot_exit(workdir, rootfd)

        LOGGER.info("Killing all of the child processes")
        for c_pid in child_pids:
            os.kill(int(c_pid), signal.SIGTERM)
        LOGGER.info("Killing the rke2 process")
        os.kill(int(process_id), signal.SIGTERM)
    except OSError as error:
        LOGGER.error("Clould not kill process: %s", error)
