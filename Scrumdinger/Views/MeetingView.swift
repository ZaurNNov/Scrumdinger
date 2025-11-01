//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Zaur  on 29.10.2025.
//

import SwiftUI
import ThemeKit
import TimerKit
import AVFoundation

struct MeetingView: View {
    
    @Binding var scrum: DailyScrum
    @State var scrumTimer: ScrumTimer = ScrumTimer()
    
    let player = AVPlayer.dingPlayer()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(theme: scrum.theme, secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining)
                Circle()
                    .strokeBorder(lineWidth: 24)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear() {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendeeNames: scrum.attendees.map { $0.name })
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
            scrumTimer.startScrum()
        }
        .onDisappear() {
            scrumTimer.stopScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    MeetingView(scrum: $scrum)
}
