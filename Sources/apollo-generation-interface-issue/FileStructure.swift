import Foundation
import ApolloCodegenLib

// An object representing the filesystem structure. Allows you to grab references to folders in the filesystem without having to pass them through as environment variables.
struct FileStructure {

    let sourceRootURL: URL
    let cliFolderURL: URL

    init() throws {
        // Grab the parent folder of this file on the filesystem
        let parentFolderOfScriptFile = FileFinder.findParentFolder()
        CodegenLogger.log("Parent folder of script file: \(parentFolderOfScriptFile)")

        self.sourceRootURL = parentFolderOfScriptFile
          .apollo.parentFolderURL() // Result: Sources folder
          .apollo.parentFolderURL() // Result: ApolloCodegen folder

        // Set up the folder where you want the typescript CLI to download.
        self.cliFolderURL = sourceRootURL
          .apollo.childFolderURL(folderName: "ApolloCLI")
    }
}

extension FileStructure: CustomDebugStringConvertible {
    var debugDescription: String {
        """
        Source root URL: \(self.sourceRootURL)
        CLI folder URL: \(self.cliFolderURL)
        """
    }
}
