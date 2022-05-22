# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# go lang bin
[ -d "$HOME/.go/bin" ] && PATH="$HOME/.go/bin:$PATH"

# add cuda toolkit to PATH
#[ -d "/usr/local/cuda-10.1/bin" ] && PATH="$PATH:/usr/local/cuda-10.1/bin"

# add llvm toolkit to PATH
#[ -d "/usr/lib/llvm-9/bin" ] && PATH="$PATH:/usr/lib/llvm-9/bin"

# set java home
#[ -d "/usr/lib/jvm/java-11-openjdk" ] && export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"

# set android home
#[ -d "/opt/android-sdk" ] && export ANDROID_HOME="/opt/android-sdk"

# set editor
export EDITOR="vim"
