//
//  Photos2026App.swift
//  Photos2026
//
//  Created by Caleb on 2026-03-02.
//

import SwiftUI
import SwiftData

@main
struct Photos2026App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
				.modelContainer(for: Photo.self)
    }
}
