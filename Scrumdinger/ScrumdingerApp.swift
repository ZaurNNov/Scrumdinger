//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Zaur  on 29.10.2025.
//

import SwiftUI
import SwiftData

@main
struct ScrumdingerApp: App {
        
    var body: some Scene {
        WindowGroup {
            ScrumsView()
        }
        .modelContainer(for: DailyScrum.self)
    }
}
