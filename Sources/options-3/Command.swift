// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct ImageFilter: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Learn how Options can have custom short names"
    )

    @Option(name: .shortAndLong)
    var input: String

    @Option(name: .shortAndLong)
    var output: String

    mutating func run() {
        print("Using file at: \(input)")
        print("Image saved at: \(output)")
    }
}
