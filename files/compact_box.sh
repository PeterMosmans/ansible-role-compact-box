# compact_box - Compacts files on the box
#
#    (c) 2015 Peter Mosmans [Go Forward]
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
unset HISTFILE
USERLIST='/root /home/*'
USERFILELIST='.bash_history .zsh_history .zcompdump-*'
USERDIRLIST=.ansible
FILELIST='/var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin /var/log/wtmp'
updatedb 2>/dev/null
apt-get clean
apt-get autoremove
for user in $USERLIST; do
    for files in $USERFILELIST; do rm -f $user/$files; done
    for dirs in $USERDIRLIST; do rm -rf $user/$dirs; done
done
for files in $FILELIST; do rm -f $files; done
logrotate --force /etc/logrotate.conf
find /var/log/ -name '*[0-5]*' -exec rm {} \; 2>/dev/null
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
history -c && shutdown -h now
