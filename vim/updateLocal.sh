##############################################################################
# 
# A small script to help copy the dotfiles in this directory to your local
# user directory (~/)
#
#############################################################################

cp ./.vimrc  ~/
if [ $? -ne 0 ]; then
  echo "Failed to copy .vimrc to ~/"
  exit -1
fi
cp -r ./.vim ~/
if [ $? -ne 0 ]; then
  echo "Failed to copy .vim to ~/"
  exit -1
fi
