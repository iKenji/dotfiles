if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

if [ -f ~/.bashrc_ex ] ; then
. ~/.bashrc_ex
fi
export PATH="/usr/local/sbin:$PATH"
