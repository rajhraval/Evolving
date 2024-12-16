//
//  EvolvingApp.swift
//  Evolving
//
//  Created by Raj Raval on 13/12/24.
//

import SwiftUI

@main
struct EvolvingApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

var isPreview: Bool {
    ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}
