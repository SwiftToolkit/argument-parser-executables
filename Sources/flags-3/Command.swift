// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

enum AppDistribution: String, EnumerableFlag {
    case appstore
    case testflight
    case enterprise
    case altstore
}

@main
struct DeployApp: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Learn how EnumerableFlag works"
    )

    @Flag var distributions: [AppDistribution]

    func run() throws {
        print("Selected distribution types are: \(distributions.map(\.rawValue))")
    }
}
