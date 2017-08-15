##############################################################################
# 
# A small script to help copy the dotfiles in this directory to your local
# user directory (~/)
#
#############################################################################

#cp ./.bash_profile ~/

# source this .bash_profile into ~/.bash_profile
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME_BASHRC=$HOME/.bash_profile
CUSTOM_BASHRC=$SCRIPT_DIR/.bash_profile

if [ ! -f $HOME_BASHRC ]; then
    touch $HOME_BASHRC
fi

SOURCE_MSG=". $CUSTOM_BASHRC"
if ! grep -q "$SOURCE_MSG" "$HOME_BASHRC"; then
    echo "# custom bash_profile added" >> $HOME_BASHRC
    echo "$SOURCE_MSG" >> $HOME_BASHRC
fi


