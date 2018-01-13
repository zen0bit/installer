#Copyright (C) Christopher Díaz Riveros <chrisadr@gentoo.org>
#
#step4.py is part of Stager.
#
#Stager is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License v2 as published by
#the Free Software Foundation, either version 2 of the License, or
#(at your option) any later version.
#
#Stager is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License v2 for more details.
#
#You should have received a copy of the GNU General Public License v2
#along with Stager.  If not, see <http://www.gnu.org/licenses/>.

import pym.stager.oshelper as oshelper
import pym.stager.step5 as step5

welcome_msg='''\
                        Step 4 - Configuring compile options
===============================================================================
Now we need to prepare Portage for the first update. All the env variables used
by Portage are written in /mnt/gentoo/etc/portage/make.conf,for a more detailed
list of all possible variables, refer to:

/mnt/gentoo/usr/share/portage/config/make.conf.example

Since we are going to prepare the first update, we only need to set these
variables:(you can use `nano` or another text editor)

    CFLAGS="-march=native -O2 -pipe"
Explanation:
    -march=native: tells the compiler to select the target
                   architecture of the current system.
    -O2:(capital O letter) gcc optimization class flag, recommended.

    MAKEOPTS="-jX"
Where:
    X: number of CPUs (CPU cores) plus one. Example: -j2
'''

def init(args):
    if args.tui:
        pass
    else:
        prepare_make_conf()
        check_data_saved()
        step5.init(args)

def prepare_make_conf():
    global welcome_msg
    oshelper.show_msg_open_shell(welcome_msg)
    
def check_data_saved():
    if oshelper.check_makeconf_march():
        oshelper.print_and_wait("Great! Now we can start Step 5")
    else:
        oshelper.show_msg_open_shell("Please review your make.conf file, something is wrong")
        check_data_saved()
