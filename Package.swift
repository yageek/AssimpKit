// swift-tools-version:5.3
import PackageDescription

let package = Package(
	name: "AssimpKit",
	products: [
		.library(
			name: "AssimpKit",
			targets: ["AssimpKit"]
		),
	],
	targets: [
		.binaryTarget(
			name: "AssimpKit",
			url: "https://github.com/showpad/AssimpKit/releases/download/1.3.0/AssimpKit.xcframework.zip",
			checksum: "adcb2762d2c1253b41fd0edf269e1ceb2f0decf891a9af300b6494a05b00f9d5"
		),
	]
)

