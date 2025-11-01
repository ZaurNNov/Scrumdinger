//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Zaur on 01.11.2025.
//

import SwiftUI
import ThemeKit

struct ThemeView: View {
    
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: CGFloat(4)))
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
