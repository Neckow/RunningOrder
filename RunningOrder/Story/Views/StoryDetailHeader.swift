//
//  StoryDetailHeader.swift
//  RunningOrder
//
//  Created by Lucas Barbero on 10/08/2020.
//  Copyright © 2020 Worldline. All rights reserved.
//

import SwiftUI

extension StoryDetailHeader {
    struct InternalView: View {
        @Environment(\.epicColor) var epicColor
        @State var story: Story
        @ObservedObject var logic: Logic

        var body: some View {
            HStack {
                Tag(story.ticketReference, color: Color.gray)
                Tag(story.epic, color: epicColor)
                Toggle("Ready for Demo", isOn: $story.readyForDemo)
                    .frame(width: 300)
                Spacer()

                if let userName = logic.userName {
                    Label(userName, systemImage: "person.circle.fill")
                        .font(Font.title2.bold())
                }
            }
            .onAppear {
                logic.fetchUsername(for: story)
            }
        }
    }
}

struct StoryDetailHeader: View {
    @EnvironmentObject var userManager: UserManager
    let story: Story

    var body: some View {
        InternalView(story: story, logic: Logic(userManager: userManager))
    }
}

struct StoryDetailHeader_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailHeader(story: Story.Previews.stories[0])
            .environmentObject(UserManager.preview)
    }
}
