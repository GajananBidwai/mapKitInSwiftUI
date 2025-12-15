//
//  MapkitInSwiftUIApp.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 15/12/25.
//

import SwiftUI

@main
struct MapkitInSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ApplicationData.shared)
        }
    }
}
