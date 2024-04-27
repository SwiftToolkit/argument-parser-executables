// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation

@main
struct MyTool: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Get a random integer"
    )

    @Flag var verbose = false

    func run() throws {
        if verbose {
            print("Starting Flags example at \(Date())")
        }

        let result = someInt()
        print("Random int:", result)

        if verbose {
            print("Flags example finished at \(Date())")
        }
    }

    private func someInt() -> Int {
        Int.random(in: 0...100)
    }
}

//struct Taylor: ParsableCommand {
//    static let configuration = CommandConfiguration(
//        abstract: "Get a random sentence from a Taylor Swift lyric"
//    )
//
//    @Flag var verbose: Bool = false
//
//    @Flag(name: .customLong("save"), inversion: .prefixedNo)
//    var shouldSave: Bool
//
//    mutating func run() {
//        if verbose {
//            print("The save flag is \(shouldSave ? "enabled" : "disabled")")
//        }
//
//        let sentence = getSentence()
//
//        print(sentence)
//
//        if shouldSave {
//            print("Lyrics were saved successfully")
//        }
//    }
//
//    private func getSentence() -> String {
//        [
//            "Welcome to New York, it's been waiting for you",
//            "'Cause the players gonna play, play, play, play, play",
//            "Been here all along, so why can't you see?"
//        ].randomElement()!
//    }
//}
