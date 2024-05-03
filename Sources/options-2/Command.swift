// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

enum Channel: String, ExpressibleByArgument, CaseIterable {
    case slack
    case telegram
}

@main
struct SendMessage: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Learn how ExpressibleByArgument can improve your Options"
    )

    @Option var channel: Channel
    @Option var message: String = "Build succeeded"

    func run() {
        print("Will send the following message on \(channel):")
        print(message)

        // send the message...
    }
}
