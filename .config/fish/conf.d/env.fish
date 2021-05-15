# GPG
set -x GPG_TTY (tty)

# XServer
set -x DISPLAY (grep -oP "(?<=nameserver ).+" /etc/resolv.conf):0.0
