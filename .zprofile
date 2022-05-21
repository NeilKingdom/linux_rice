#
# ~/.zprofile
#

export ZDOTDIR="$HOME/.config/zsh"
# For scli
export DBUS_SESSION_BUS_ADDRESS="$(echo $(dbus-daemon --fork --session --print-address))" 
#export JAVA_HOME="/usr/lib/jvm/java-default"
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
#export JAVA_HOME="/usr/lib/jvm/java-11/openjdk""
export PATH="$JAVA_HOME/bin:$HOME/scripts:$PATH"
