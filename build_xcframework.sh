#!/bin/sh

# Abort if any command fails
set -e

WORKSPACE="AssimpKit/AssimpKit.xcworkspace"
OUTPUT_FOLDER="output"

DEVICE_ARCHIVE="$OUTPUT_FOLDER/AssimpKit.framework-iphoneos.xcarchive"
SIMULATOR_ARCHIVE="$OUTPUT_FOLDER/AssimpKit.framework-iphonesimulator.xcarchive"
CATALYST_ARCHIVE="$OUTPUT_FOLDER/AssimpKit.framework-catalyst.xcarchive"

XCFRAMEWORK_NAME="AssimpKit.xcframework"
XCFRAMEWORK_PATH="$OUTPUT_FOLDER/$XCFRAMEWORK_NAME"

ARCHIVE_SUBPATH="Products/Library/Frameworks/AssimpKit.framework"


rm -rf "$OUTPUT_FOLDER"
mkdir "$OUTPUT_FOLDER"



# Device slice.
xcodebuild archive -workspace "$WORKSPACE" -scheme 'AssimpKit-iOS' -configuration Release -destination 'generic/platform=iOS' -archivePath "$DEVICE_ARCHIVE" SKIP_INSTALL=NO

# Simulator slice.
xcodebuild archive -workspace "$WORKSPACE" -scheme 'AssimpKit-iOS' -configuration Release -destination 'generic/platform=iOS Simulator' -archivePath "$SIMULATOR_ARCHIVE" SKIP_INSTALL=NO

# Mac Catalyst slice.
xcodebuild archive -workspace "$WORKSPACE" -scheme 'AssimpKit-macOS' -configuration Release -destination 'platform=macOS,arch=x86_64' -archivePath "$CATALYST_ARCHIVE" SKIP_INSTALL=NO

# Create the XCFramework
xcodebuild -create-xcframework -framework "$DEVICE_ARCHIVE/$ARCHIVE_SUBPATH" -framework "$SIMULATOR_ARCHIVE/$ARCHIVE_SUBPATH" -framework "$CATALYST_ARCHIVE/$ARCHIVE_SUBPATH" -output "$XCFRAMEWORK_PATH"



# Zip
pushd "$OUTPUT_FOLDER"
zip -vr "$XCFRAMEWORK_NAME.zip" "$XCFRAMEWORK_NAME" -x "*.DS_Store"
popd


CHECKSUM=`swift package compute-checksum "$XCFRAMEWORK_PATH.zip"`

echo "Checksum: $CHECKSUM"