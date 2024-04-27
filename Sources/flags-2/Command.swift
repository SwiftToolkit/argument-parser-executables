// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct Flags: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Interact with flags and their name specifications"
    )

    @Flag(
        inversion: .prefixedEnableDisable,
        help: "Shows how to turn on/off a flag with a \"enable\" or \"disable\" prefix"
    )
    var cache = false

    @Flag(
        inversion: .prefixedNo,
        help: "Shows how to turn on a flag with a \"no\" prefix"
    )
    var open = true

    @Flag(
        name: .customLong("encrypt"),
        inversion: .prefixedNo,
        help: "Shows how a flag can have a custom name and also a \"no\" prefix for inversion"
    )
    var shouldUseEncryption = true

    func run() throws {
        print("Cache is \(cache ? "enabled" : "disabled")")
        print("Open? \(shouldUseEncryption)")
        print("Encrypt? \(shouldUseEncryption)")
    }
}
