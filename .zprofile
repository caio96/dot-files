# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# local pip 
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

[ -d "/usr/lib/jvm/java-9-openjdk" ] && export JAVA_HOME="/usr/lib/jvm/java-9-openjdk"

[ -d "/opt/android-sdk" ] && export ANDROID_HOME="/opt/android-sdk"

