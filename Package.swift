// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "HindleyMilnerW",
  dependencies: [
    .package(url: "https://github.com/antlr/antlr4", from: "4.13.1")
  ],

  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .executableTarget(
      name: "HindleyMilnerW",
      dependencies: [
        .product(name: "Antlr4", package: "antlr4")
      ],
      path: "Sources",
      exclude: [
        "antlr-g4", "antlr/Lang.interp", "antlr/Lang.tokens", "antlr/LangLexer.interp",
        "antlr/LangLexer.tokens",
      ]
    ),
    .testTarget(
      name: "HindleyMilnerWTests",
      dependencies: ["HindleyMilnerW", .product(name: "Antlr4", package: "antlr4")]),
  ]
)
