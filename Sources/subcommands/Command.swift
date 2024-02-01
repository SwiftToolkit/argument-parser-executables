// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct MyTool: ParsableCommand {
    static let configuration = CommandConfiguration(
        subcommands: [Auth.self]
    )
}

struct Auth: ParsableCommand {
    static let configuration = CommandConfiguration(
        subcommands: [Login.self, Me.self, Logout.self],
        defaultSubcommand: Me.self
    )
}

struct Login: ParsableCommand {
    @Option
    var username: String

    func run() throws {
        print("Proceeding to authenticate \(username)...")
        print("(not really, this is just an example)")
    }
}

struct Me: ParsableCommand {
    func run() throws {
        print("Current session")
        print("- User: SwiftToolkit")
        print("- Token: abc123")
        print("(not really, this is just an example)")
    }
}

struct Logout: ParsableCommand {
    func run() throws {
        print("Logged out current user")
        print("(not really, this is just an example)")
    }
}
