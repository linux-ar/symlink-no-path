#!/bin/bash

sed -i '/buildToolsVersion/c buildToolsVersion "30.0.1"' app/build.gradle
sed -i '/com.android.tools.build:gradle/c classpath "com.android.tools.build:gradle:3.6.4"  ' app/build.gradle
sed -i '/compileSdkVersion/c compileSdkVersion 29' app/build.gradle

echo "sdk.dir=/opt/sdk/android" > local.properties
