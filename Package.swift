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
			checksum: "bfb412ada4d291e22542c2d06b3e9f811616fb043fbd12660b0108541eb33a3c"
		),
	]
)

