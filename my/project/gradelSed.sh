#!/data/data/com.termux/files/usr/bin/zsh

sed -i '/buildToolsVersion/c buildToolsVersion "30.0.1"' app/build.gradle
sed -i '/com.android.tools.build:gradle/c classpath "com.android.tools.build:gradle:3.6.4"  ' app/build.gradle
sed -i '/compileSdkVersion/c compileSdkVersion 29' app/build.gradle

echo "sdk.dir=/data/data/com.termux/files/home/android-sdk" > local.properties
