import Foundation

//  ReverseString.swift
//
//  Created by Kent Gatera
//  Created on 2024-04-26
//  Version 1.0
//  Copyright (c) Kent Gatera. All rights reserved.
//
//  This program reverses the string it is fed..

enum ErrorCases: Error {
    case invalidInput
}

func recReverse(inputString: String) throws -> String {
    if inputString.isEmpty {
        return inputString
    } else {
        let firstCharacter = inputString[inputString.startIndex]
        let remainingString = inputString.dropFirst()
        return try recReverse(inputString: String(remainingString)) + String(firstCharacter)
    }
}

do {
    // Define file URLs
    let inputFilePath = URL(fileURLWithPath: "input.txt")
    let outputFilePath = URL(fileURLWithPath: "output.txt")
    
    // Read file contents
    let fileContents = try String(contentsOf: inputFilePath, encoding: .utf8)
    let fileLines = fileContents.components(separatedBy: .newlines)
    
    // Process each line
    var outputLines = [String]()
    for line in fileLines {
        let reversedLine = try recReverse(inputString: line)
        outputLines.append(reversedLine)
    }
    
    // Join reversed lines and write to output file
    let output = outputLines.joined(separator: "\n")
    try output.write(to: outputFilePath, atomically: true, encoding: .utf8)
} catch {
    print("Error: \(error)")
}
