# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# add anaconda to path if it exists
if [ -d "$HOME/.anaconda3" ] ; then
    PATH="$HOME/.anaconda3/bin":"$PATH"
fi

#[ -d "/usr/lib/jvm/java-9-openjdk" ] && export JAVA_HOME="/usr/lib/jvm/java-9-openjdk"
#[ -d "/usr/lib/jvm/java-8-openjdk" ] && export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
[ -d "/usr/lib/jvm/java-10-jdk" ] && export JAVA_HOME="/usr/lib/jvm/java-10-jdk"


[ -d "/opt/android-sdk" ] && export ANDROID_HOME="/opt/android-sdk"

