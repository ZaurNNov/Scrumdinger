//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Zaur on 31.10.2025.
//

import SwiftUI

struct DetailEditView: View {
    
    @State private var scrum = DailyScrum.emptyScrum
    @State private var attendeeName = ""
    
    var body: some View {
        Form {
            Section("Meeting Info") {
                TextField("title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { index in
                    scrum.attendees.remove(atOffsets: index)
                }
                HStack {
                    TextField("New Attendee", text: $attendeeName)
                    Button(action: {
                        let attendee = DailyScrum.Attendee(name: attendeeName)
                        withAnimation {
                            scrum.attendees.append(attendee)
                            attendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(attendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DetailEditView()
}
