##############################################################################
# 
# A small script to help copy the dotfiles in this directory to your local
# user directory (~/)
#
#############################################################################

cp ./.bash_profile ~/
if [ $? -ne 0 ]; then
  echo "Failed to copy .bash_profile ~/"
  exit -1
fi
