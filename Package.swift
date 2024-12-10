// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BezelTivis",
  platforms: [
    .macOS(.v11),
    .iOS(.v15)
  ],
  products: [
    .library(
      name: "BezelTivis",
      targets: ["BezelTivis"]
    )
  ],
  dependencies: [
    // .package(url: /* package url */, from: "1.0.0"),
  ],
  targets: [
    .executableTarget(
      name: "BezelTivisCLI",
      dependencies: [
        "BezelTivis"
      ]
    ),
    .target(
      name: "BezelTivis",
      dependencies: []
    ),
    .testTarget(
      name: "BezelTivisTests",
      dependencies: ["BezelTivis"]
    )
  ]
)
