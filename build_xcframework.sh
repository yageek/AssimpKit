#!/bin/sh

# Abort if any command fails
set -e

rm -rf output
mkdir output


# Device slice.
xcodebuild archive -workspace 'AssimpKit/AssimpKit.xcworkspace' -scheme 'AssimpKit-iOS' -configuration Release -destination 'generic/platform=iOS' -archivePath 'output/AssimpKit.framework-iphoneos.xcarchive' SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

# Simulator slice.
xcodebuild archive -workspace 'AssimpKit/AssimpKit.xcworkspace' -scheme 'AssimpKit-iOS' -configuration Release -destination 'generic/platform=iOS Simulator' -archivePath 'output/AssimpKit.framework-iphonesimulator.xcarchive' SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

# Mac Catalyst slice.
xcodebuild archive -workspace 'AssimpKit/AssimpKit.xcworkspace' -scheme 'AssimpKit-macOS' -configuration Release -destination 'platform=macOS,arch=x86_64' -archivePath 'output/AssimpKit.framework-catalyst.xcarchive' SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES UseModernBuildSystem=NO


# Create the XCFramework
xcodebuild -create-xcframework -framework 'output/AssimpKit.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/AssimpKit.framework' -framework 'output/AssimpKit.framework-iphoneos.xcarchive/Products/Library/Frameworks/AssimpKit.framework' -framework 'output/AssimpKit.framework-catalyst.xcarchive/Products/Library/Frameworks/AssimpKit.framework' -output 'output/AssimpKit.xcframework'

