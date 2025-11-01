//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Zaur  on 29.10.2025.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
