// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct MyTool: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Reverse a string",
        discussion: "A tiny command-line tool to reverse a string."
    )

    @Argument
    var text: String

    mutating func run() throws {
        print(String(text.reversed()))
    }
}
