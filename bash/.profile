source .bashrc


export ANDROID_HOME=/apps/Android/Sdk
export RLWRAP_HOME=$HOME/.local/rlwrap
export PKG_CONFIG_PATH=$HOME/Qt/5.12.5/gcc_64/lib/pkgconfig
export IDF_TOOLS_PATH=$HOME/.config/espressif


# MODIFICADO
PATH=$PATH:$HOME/bin
PATH=$PATH:/usr/local/lib/nodejs/bin/
PATH=$PATH:$HOME/source/julia-1.5.1/bin
PATH=$PATH:$HOME/source/flutter/bin
PATH=$PATH:$HOME/source/alacritty/target/release
PATH=$PATH:$HOME/Qt/5.12.5/gcc_64/bin
PATH=$PATH:$HOME/Qt/Tools/QtCreator/bin
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/.local/node/bin
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:$HOME/.config/espressif
PATH=$PATH:$ANDROID_HOME/emulator
PATH=$PATH:$ANDROID_HOME/tools
PATH=$PATH:$ANDROID_HOME/tools/bin
PATH=$PATH:$ANDROID_HOME/platform-tools
PATH="$HOME/.poetry/bin:$PATH"

export PATH

