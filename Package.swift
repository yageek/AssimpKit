// swift-tools-version:5.3
import PackageDescription

let package = Package(
	name: "AssimpKit",
	products: [
		.library(
			name: "AssimpKit",
			targets: ["AssimpKit"]
		),
		.library(
			name: "AssimpKitDynamic",
			type: .dynamic,
			targets: ["AssimpKitDynamic"]
		),
	],
	targets: [
		.binaryTarget(
			name: "AssimpKit",
			url: "https://github.com/showpad/AssimpKit/releases/download/1.3.3/AssimpKit.xcframework.zip",
			checksum: "8107773438568f2f864f5c08ceb2ce2efae95cf8b67eb3cdc2df7a61aea54c26"
		),
		
		// Needed to create a dynamic target that contains the statically linked AssimpKit
		// Issue with App extensions embedding AssimpKit twice in the bundle and ITMS rejecting
		// due to duplicate framework issues
		// https://forums.swift.org/t/swift-packages-in-multiple-targets-results-in-this-will-result-in-duplication-of-library-code-errors/34892/47
		.target(
			name: "AssimpKitDynamic",
			dependencies: [
				"AssimpKit",
			],
			path: "AssimpKitDynamic"
		),
	]
)

