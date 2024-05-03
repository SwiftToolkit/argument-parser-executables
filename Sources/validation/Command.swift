// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct EchoMessage: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Learn how to perform custom validation of a command's input"
    )

    @Option var count: Int
    @Option var message: String = "Hello, reader"

    func validate() throws {
        if message.isEmpty {
            throw ValidationError("message cannot be empty")
        }

        guard count >= 1, count <= 5 else {
            throw ValidationError("count must be in higher than 0, up to 5")
        }
    }

    func run() throws {
        (1...count).forEach { index in
            print(index, message)
        }
    }
}
