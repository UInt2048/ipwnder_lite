# Built on macOS 14.4.1
# The iPhoneOS 9.2 SDK must be present in /Applications/Xcode.app. I've put the entire Xcode 7.2 here; the fact that it's incompatible is irrelevant.
# Xcode 15.3 is at /Applications/Xcode15.app. You can use a different version but it must be compatible with the system macOS.

brew install ldid dpkg

export IOS_SDK=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.2.sdk
export MACOSX_SDK=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk

sudo cp -r $MACOSX_SDK/System/Library/Frameworks/IOKit.framework/Headers/ \
    $IOS_SDK/System/Library/Frameworks/IOKit.framework/Headers/ && \
sudo cp $MACOSX_SDK/usr/include/libkern/OSTypes.h \
    $IOS_SDK/usr/include/libkern/ && \
sudo xcode-select -s /Applications/Xcode15.app && \
sudo xcodebuild -license accept && \
./mk_iphoneos32.sh && ./mk_iphoneos64.sh && ./mk_iphoneos_generic.sh && \
mkdir -p iphoneos_deb/usr/local/bin && mv ipwnder_lite iphoneos_deb/usr/local/bin/ipwnder_lite && \
mkdir iphoneos_deb/DEBIAN && cp control iphoneos_deb/DEBIAN/control && \
find . -name ".DS_Store" -delete && dpkg-deb -b iphoneos_deb && dpkg-name iphoneos_deb.deb

