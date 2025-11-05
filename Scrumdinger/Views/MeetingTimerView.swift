//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Zaur on 05.11.2025.
//

import SwiftUI
import ThemeKit
import TimerKit

struct MeetingTimerView: View {
    
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    
    private var currenrSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currenrSpeaker)
                        .font(.title)
                    Text("is speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                        SpeakerArc(speakerIdex: index, totalSpeakers: speakers.count)
                            .rotation(.degrees(-90.0))
                            .stroke(theme.mainColor, lineWidth: 12)
                        
                    }
                }
            }
            .padding(.horizontal)
    }
}

#Preview {
    let speakers = [ScrumTimer.Speaker(name: "Poul", isCompleted: true), ScrumTimer.Speaker(name: "Jenefer", isCompleted: false)]
    MeetingTimerView(speakers: speakers, theme: Theme.orange)
}
