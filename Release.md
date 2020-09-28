On `master`:
- run ./build_xcframework.sh
- copy the checksum and paste it in the Package.swift file
- update the download URL in the Package.swift file to the upcoming version


Create a new release on GitHub:
- https://github.com/showpad/AssimpKit/releases/new
- set the version to the same one you've entered in the Package.swift file
- upload the `output/AssimpKit.xcframework.zip` file
- save as Draft

On `master`
- commit the changes you made to `Package.swift`
- push your changes

On Github again:
- publish the release