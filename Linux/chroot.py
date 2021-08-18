def chroot_entry(path):
    """Helps to chroot to a given PATH.

    Args:
        path (str): PATH to chroot.

    Returns:
        str, int: Previous working directory and previous root file desciptor.
    """
    try:
        LOGGER.info("Entering chroot PATH: %s", path)
        previous_work_dir = os.getcwd()
        previous_root_fd = os.open("/", os.O_RDONLY)
        os.chroot(path)
        os.chdir("/")
        return previous_work_dir, previous_root_fd
    except PermissionError:
        LOGGER.exception("Chroot operarion not permitted: %s", path)


def chroot_exit(prev_workdir, prev_rootfd):
    """Helps to exit from a chroot.

    Args:
        prev_workdir (str): Previous working directry path.
        prev_rootfd (int): Previous root file desciptor.
    """
    try:
        os.fchdir(prev_rootfd)
        os.chroot(".")
        os.close(prev_rootfd)
        os.chdir(prev_workdir)
        LOGGER.info("Exiting chroot, back to PATH: %s", prev_workdir)
    except OSError as error:
        LOGGER.exception(
            "An exeption occurred while exiting the chroot: %s", error
        )
