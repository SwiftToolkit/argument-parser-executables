// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

enum LogLevel: String, ExpressibleByArgument, CaseIterable {
    case verbose
    case info
    case debug
    case warning
    case error
}

struct SharedOptions: ParsableArguments {
    @Option(name: .shortAndLong)
    var logLevel: LogLevel

    @Flag(name: .shortAndLong)
    var clearDerivedData = false
}

@main
struct Builder: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Learn how OptionGroup works",
        subcommands: [Build.self, Run.self, Archive.self]
    )
}

struct Build: ParsableCommand {
    @OptionGroup var options: SharedOptions

    func run() throws {
        if options.clearDerivedData {
            print("Clearing derived data first...")
        }

        print("Building your project. LogLevel: \(options.logLevel)")
    }
}

struct Run: ParsableCommand {
    @OptionGroup var options: SharedOptions

    func run() throws {
        if options.clearDerivedData {
            print("Clearing derived data first...")
        }

        print("Building your project. LogLevel: \(options.logLevel)")
    }
}

struct Archive: ParsableCommand {
    @OptionGroup var options: SharedOptions

    func run() throws {
        if options.clearDerivedData {
            print("Clearing derived data first...")
        }

        print("Building your project. LogLevel: \(options.logLevel)")
    }
}
