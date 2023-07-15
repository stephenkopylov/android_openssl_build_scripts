read -p "Enter your NDK version:" NDK_VERSION

if [ "$NDK_VERSION" == "" ];then
   echo "Error! Wrong NDK version or ANDROID_HOME not set"
   set -e
fi

TOOLCHAIN_PATH=$(python3 toolchains_path.py --ndk $ANDROID_HOME/ndk/${NDK_VERSION})

if [ "$TOOLCHAIN_PATH" == "" ];then
   echo "Error! Can't find proper toolchain. Wrong NDK version or ANDROID_HOME not set"
   set -e
else
	echo "Toolchain found ${TOOLCHAIN_PATH}"
fi

export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/$NDK_VERSION && export TOOLCHAIN_PATH=$TOOLCHAIN_PATH && export ARC=android-arm && export OUTPUT_ARC=armeabi-v7a && export API_V=16 && sh build.sh
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/$NDK_VERSION && export TOOLCHAIN_PATH=$TOOLCHAIN_PATH && export ARC=android-arm64 && export OUTPUT_ARC=arm64-v8a && export API_V=21 && sh build.sh
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/$NDK_VERSION && export TOOLCHAIN_PATH=$TOOLCHAIN_PATH && export ARC=android-x86 && export OUTPUT_ARC=x86 && export API_V=16 && sh build.sh
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/$NDK_VERSION && export TOOLCHAIN_PATH=$TOOLCHAIN_PATH && export ARC=android-x86_64 && export OUTPUT_ARC=x86_64 && export API_V=21 && sh build.sh