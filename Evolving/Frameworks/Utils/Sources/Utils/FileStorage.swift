//
//  FileStorage.swift
//  Utils
//
//  Created by Raj Raval on 16/12/24.
//

import Foundation

public final class FileStorage {
    private var documentsDirectory: URL {
        URL.documentsDirectory
    }

    public func save<T: Encodable>(_ data: T, to fileName: String) {
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        do {
            guard let codableData = data.codableData else { fatalError("Error encoding Data") }
            try codableData.write(to: fileURL)
        } catch {
            debugPrint("Error saving file \(fileURL.path): \(error.localizedDescription)")
        }
    }

    public func load<T: Decodable>(from fileName: String, as type: T.Type) -> T? {
        let fileURL = documentsDirectory.appendingPathComponent(fileName)

        if !fileExists(at: fileName) {
            debugPrint("File not found at: \(fileName)")
            return nil
        }

        if let data = FileManager.default.contents(atPath: fileURL.path) {
            let decodedType: T? = T.fromData(data)
            return decodedType
        } else {
            debugPrint("Not data found at: \(fileURL.path)")
            return nil
        }
    }

    func fileExists(at fileName: String) -> Bool {
        let url = documentsDirectory.appendingPathComponent(fileName)
        return FileManager.default.fileExists(atPath: url.path)
    }
}
