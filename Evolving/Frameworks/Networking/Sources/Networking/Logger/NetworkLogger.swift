//
//  NetworkLogger.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import Foundation
import os

internal final class NetworkLogger {

    static private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "com.rajraval.SwiftUIApp", category: "SwiftUIApp")

    public static var shouldLog: Bool = {
        #if DEBUG
            true
        #else
            false
        #endif
    }()

    static private func log(
        logType: LogType,
        messages: Any...,
        file: String,
        function: String,
        line: Int
    ) {
        if Self.shouldLog {
            let message = [
                logType.rawValue,
                URL(fileURLWithPath: file).lastPathComponent,
                function,
                String(line)
            ] + messages.map { "\($0)" }
            let log = message.joined(separator: " ")
            switch logType {
            case .error:
                logger.log(level: .error, "\(log)")
            case .warning:
                logger.warning("\(log)")
            case .message:
                logger.log(level: .default, "\(log)")
            case .info:
                logger.log(level: .default, "\(log)")
            }
        }
    }

    static func info(
        _ messages: Any...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(logType: .info, messages: messages, file: file, function: function, line: line)
    }

    static func message(
        _ messages: Any...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(logType: .message, messages: messages, file: file, function: function, line: line)
    }

    static func warning(
        _ messages: Any...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(logType: .warning, messages: messages, file: file, function: function, line: line)
    }

    static func error(
        _ error: Error,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(logType: .error, messages: error, file: file, function: function, line: line)
    }

    static func logNetworkRequest(for url: URL, endpoint: Endpoint? = nil) {
        NetworkLogger.info("------------------------------------------")
        NetworkLogger.info("⬆️ API REQUEST")
        NetworkLogger.info("REQUEST URL: \(url)")
        if let endpoint {
            NetworkLogger.info("REQUEST METHOD: \(endpoint.method.rawValue)")
            if let headers = endpoint.headers {
                NetworkLogger.info("REQUEST HEADERS: [\(headers)]")
            }
            if let body = endpoint.body {
                NetworkLogger.info("REQUEST BODY: [\(body.prettyPrintToJSON)]")
            }
            if let parameters = endpoint.queryItems {
                NetworkLogger.info("REQUEST QUERY PARAMETERS: [\(parameters)]")
            }
        }
        NetworkLogger.info("------------------------------------------")
    }

    static func logNetworkResponse(for httpResponse: HTTPURLResponse, data: Data, error: Error? = nil) {
        NetworkLogger.info("------------------------------------------")
        NetworkLogger.info("⬇️ API RESPONSE")
        NetworkLogger.info("RESPONSE: \(httpResponse)")
        NetworkLogger.info("RESPONSE CODE: \(httpResponse.statusCode)")
        NetworkLogger.info("RESPONSE HEADERS: \(httpResponse.allHeaderFields)")
        NetworkLogger.info("RESPONSE BODY: \(data.prettyPrintToJSON)")
        if let error {
            NetworkLogger.error(error)
        }
        NetworkLogger.info("------------------------------------------")
    }


}
