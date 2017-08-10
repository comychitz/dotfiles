##############################################################################
# 
# A small script to help copy the dotfiles in this directory to your local
# user directory (~/)
#
#############################################################################
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VIM_DIR=$HOME/.vim

#cp ./.vimrc  ~/
if [ $? -ne 0 ]; then
  echo "Failed to copy .vimrc to ~/"
  #exit -1
fi

# init ~/.vimrc file ##############################################
function vimSetupRc()
{
    local VIMRC_FILE=$HOME/.vimrc
    
    local CUSTOM_VIMRC_DIR=$SCRIPT_DIR
    local CUSTOM_VIMRC_FILE=$(readlink -m $CUSTOM_VIMRC_DIR/.vimrc)
    local VIMRC_INCLUDE_MSG="source $CUSTOM_VIMRC_FILE"
    
    # create vimrc if not exists
    if [ ! -f $VIMRC_FILE ] ; then
        touch $VIMRC_FILE
    fi    
    
    # if vimrc not contains include message
    if ! grep -q "$VIMRC_INCLUDE_MSG" "$VIMRC_FILE"; then
        echo "\" custom config include" >> $VIMRC_FILE
        echo $VIMRC_INCLUDE_MSG >> $VIMRC_FILE
    fi
}
vimSetupRc
###################################################################
