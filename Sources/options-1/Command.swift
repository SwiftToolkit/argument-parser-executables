// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct SendMessage: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Learn the basics of Options"
    )

    @Option var message: String
    @Option var retries = 3
    @Option var title: String?

    func run() {
        print("Will send the following message (with \(retries) retries):")

        if let title {
            print(title)
        }

        print(message)

        // send the message...
    }
}
