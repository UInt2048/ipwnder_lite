#/bin/sh

LIBCURL="dynamic/iphoneos-arm64/libcurl.dylib"
#LIBCURL="-lcurl"

SYSROOT="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.2.sdk"
FRAMEWORKS="-framework IOKit -framework CoreFoundation"
FLAGS="-Os -DDEBUG -DIPHONEOS_ARM -DApple_A6"

clang -isysroot $SYSROOT main.c io/iousb.c exploit/checkm8/s5l8950x.c exploit/checkm8/s5l8960x.c exploit/checkm8/s8000.c exploit/checkm8/t8010.c exploit/limera1n/limera1n.c common/common.c partialzip/partial.c -I./dynamic/include -I./include -lz $LIBCURL $FRAMEWORKS $FLAGS -arch arm64 -o ipwnder_iphoneos64
strip ipwnder_iphoneos64
ldid -S ipwnder_iphoneos64
