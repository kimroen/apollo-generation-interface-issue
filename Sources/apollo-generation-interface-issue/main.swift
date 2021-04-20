//
//  File.swift
//  
//
//  Created by Kim Røen on 20/04/2021.
//

import Foundation
import ApolloCodegenLib
import ArgumentParser

struct SwiftScript: ParsableCommand {

    static var configuration = CommandConfiguration(
            abstract: """
        A swift-based utility for performing Apollo-related tasks like downloading a schema and generating code.

        NOTE: If running from a compiled binary, prefix subcommands with `swift-script`. Otherwise use `swift run ApolloCodegen [subcommand]`.
        """,
            subcommands: [GenerateCode.self])

    /// The sub-command to generate code.
    struct GenerateCode: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "generate",
            abstract: "Generates swift code from the downloaded schema + our operations based on information set up in the `GenerateCode` command.")

        mutating func run() throws {
            let fileStructure = try FileStructure()
            CodegenLogger.log("File structure: \(fileStructure)")

            // Get the root of the target.
            let targetRootURL = fileStructure.sourceRootURL
                .apollo.childFolderURL(folderName: "Output")

            // Make sure the folder exists before trying to generate code.
            try FileManager.default.apollo.createFolderIfNeeded(at: targetRootURL)

            let schemaFileURL = try! targetRootURL.apollo.childFileURL(fileName: "schema.graphql")
            let outputFileURL = try! targetRootURL.apollo.childFileURL(fileName: "API.swift")

            let codegenOptions = ApolloCodegenOptions(
                // All graphql-files except schema.graphql
                includes: "./**/!(schema).graphql",
                omitDeprecatedEnumCases: true,
                outputFormat: .singleFile(atFileURL: outputFileURL),

                // Prefixing all custom scalars (like "DateTime") with "GraphQLScalar"
                customScalarFormat: .passthroughWithPrefix("GraphQLScalar"),
                urlToSchemaFile: schemaFileURL
            )

            // Attempt to generate code.
            try ApolloCodegen.run(from: targetRootURL,
                                  with: fileStructure.cliFolderURL,
                                  options: codegenOptions)
        }
    }
}

// This will set up the command and parse the arguments when this executable is run.
SwiftScript.main()
