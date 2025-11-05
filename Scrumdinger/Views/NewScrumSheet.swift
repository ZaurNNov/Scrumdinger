//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Zaur on 03.11.2025.
//

import SwiftUI

struct NewScrumSheet: View {
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: nil)
        }
    }
}

#Preview {
    NewScrumSheet()
}
