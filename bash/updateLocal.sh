##############################################################################
# 
# A small script to help copy the dotfiles in this directory to your local
# user directory (~/)
#
#############################################################################

cp ./.bash_prodile ~/
if [ $? -ne 0 ]; then
  echo "Failed to copy .emacs to ~/"
  exit -1
fi
