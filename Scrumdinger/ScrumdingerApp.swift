//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Zaur  on 29.10.2025.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
