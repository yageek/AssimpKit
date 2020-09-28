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
			url: "https://github.com/showpad/AssimpKit/releases/download/1.2.1/AssimpKit.xcframework.zip",
			checksum: "5a0049328c0aea7d1a303520f81197db4cb811ebcebb7d04bb0fb2262b7bf258"
		),
	]
)

