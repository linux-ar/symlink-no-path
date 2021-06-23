#!/data/data/com.termux/files/usr/bin/bash
apt update --yes
apt install --yes wget tar unzip 
mkdir -p $HOME/sdk/android-sdk/
export ANDROID_HOME=$HOME/sdk/android-sdk
install -d $ANDROID_HOME
wget --output-document=$ANDROID_HOME/cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip

pushd $ANDROID_HOME
unzip -d cmdline-tools cmdline-tools.zip
popd
export PATH=$PATH:${ANDROID_HOME}/cmdline-tools/cmdline-tools/bin/
sdkmanager --version
set +o pipefail
yes | sdkmanager --sdk_root=${ANDROID_HOME} --licenses
set -o pipefail
sdkmanager --sdk_root=${ANDROID_HOME} "platforms;android-${ANDROID_COMPILE_SDK}"
sdkmanager --sdk_root=${ANDROID_HOME} "platform-tools"
sdkmanager --sdk_root=${ANDROID_HOME} "build-tools;${ANDROID_BUILD_TOOLS}"
export PATH=$PATH:${ANDROID_HOME}/platform-tools/
# chmod +x ./gradlew
