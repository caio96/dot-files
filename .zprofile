# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

JAVA_HOME="/usr/lib/jvm/java-8-oracle"

if [ -d $JAVA_HOME ]; then
    export JAVA_HOME
fi

ANDROID_HOME="/opt/android-sdk"

if [ -d $ANDROID_HOME ]; then
    export ANDROID_HOME
fi

