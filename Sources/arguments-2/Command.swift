// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct Greet: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Greet someone by name",
        discussion: "Say hello to the person of your choice"
    )

    @Argument var name: String
    @Argument var greeting: String = "Hello"

    mutating func run() {
        print("\(greeting) \(name)!")
    }
}
