<link rel='stylesheet' href='../shared/style.css'>

# systemd

_A suite of basic building blocks for a Linux system_[[1]](1)

Not just an init system! Was created to be a replacement for the old 
SysV init[[2]](2) system, but has become much more than that.

## init system

_Note: Much of this information from this section will come from the fedora 
magazine article found [here](3). Refer to it for additional reading material._

### What is an init system?

An init system is the first process to get started after the kernel starts and
will always have a PID of 1.[[3]](3)

### daemons

The init system must start all necessary daemons in order to make the operating
system work. [[3]](3) These process will run in the background of your system.
Programs that run in the backgroud of your system are known as _daemons_.

Common processes that run as daemons are loggers, programs that watch for
devices to be connected, and job schedulers. [[4]](4)

To see all process and daemons that systemd is managing, use the `systemctl`
command in the terminal to list them.

<!-- References -->
[1]: https://www.freedesktop.org/wiki/Software/systemd/
[2]: https://en.wikipedia.org/wiki/Init#SysV-style
[3]: https://fedoramagazine.org/what-is-an-init-system/
[4]: https://en.wikipedia.org/wiki/List_of_Unix_daemons
