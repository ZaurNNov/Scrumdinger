//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Zaur on 07.11.2025.
//

import SwiftUI

struct HistoryView: View {
    
    let history: History
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees:")
                    .font(.headline)
                Text(history.attedeeString)
                if let transcript = history.transcript {
                    Text("Transcript:")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attedeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map( { $0.name }))
    }
}

#Preview {
    let history = History(
        attendees: [
            Attendee(name: "Luis"),
            Attendee(name: "Markiz"),
            Attendee(name: "Barabas")
        ], 
        transcript: "Клара у Карла украла кораллы, Карл офигел и обратно украл свой коралл. Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI..."
    )
    
    HistoryView(history: history)
}
