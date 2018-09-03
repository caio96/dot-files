# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# add anaconda to path if it exists
[ -d "$HOME/.anaconda3" ] && PATH="$HOME/.anaconda3/bin":"$PATH"

# set java home
#[ -d "/usr/lib/jvm/java-10-jdk" ] && export JAVA_HOME="/usr/lib/jvm/java-10-jdk"
#[ -d "/usr/lib/jvm/java-9-openjdk" ] && export JAVA_HOME="/usr/lib/jvm/java-9-openjdk"
#[ -d "/usr/lib/jvm/java-8-openjdk" ] && export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
[ -d "/usr/lib/jvm/java-8-jdk" ] && export JAVA_HOME="/usr/lib/jvm/java-8-jdk"

# set android home
[ -d "/opt/android-sdk" ] && export ANDROID_HOME="/opt/android-sdk"

# set editor
export EDITOR="vim"
