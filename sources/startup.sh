#!/bin/bash
sed -i '$a\fs.inotify.max_user_watches = 524288' /etc/sysctl.conf
sysctl -p --system