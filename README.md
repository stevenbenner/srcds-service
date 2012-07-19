# SRCDS Linux Service

This is a shell script that will let you run the Source Dedicated Server (SRCDS) from Valve as a service on your Linux machine.

## Requirements

* SRCDS
* Screen (Terminal multiplexer utility. See: [GNU Screen](https://www.gnu.org/software/screen/))
* Your favorite text editor

## Installation

1. Create a file named `srcds` in your `/etc/init.d` directory.
2. Paste the contents of the srcds.sh file from this repository in that file.
3. Replace `<newuser>` with the user you want to run the service under
4. Adjust the `PARAMS` string for the game you want to run.
5. Set the file permissions to be executable (`chmod a+x /etc/init.d/srcds`).

## Usage

You can manage the service just like any other init.d service. With `start`, `restart`, `stop`, and `status` commands.

* Start SRCDS: `/etc/init.d/srcds start`
* Restart SRCDS: `/etc/init.d/srcds restart`
* Stop SRCDS: `/etc/init.d/srcds stop`
* Get SRCDS status: `/etc/init.d/srcds status`

## Credits

This was originally created by FreeNerd and posted on his [Linux SRCDS server](http://www.freenerd.net/index.php?title=Linux_SRCDS_server) article.

I have modified at and updated it to suit my needs and have added several fixes provided by others in the discussion from my blog post about running a Team Fortress 2 server.

You can find the discussion here:

http://stevenbenner.com/2010/11/how-to-set-up-a-team-fortress-2-dedicated-server-on-ubuntu/
