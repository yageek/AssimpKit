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
			url: "https://github.com/showpad/AssimpKit/releases/download/1.3.1/AssimpKit.xcframework.zip",
			checksum: "68ed4708dcb19011d06bcd6bbfa47c3f53dc2af0beb236d546397f372baf7727"
		),
	]
)

