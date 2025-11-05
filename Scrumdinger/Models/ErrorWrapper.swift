//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Zaur on 05.11.2025.
//

import Foundation


struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
