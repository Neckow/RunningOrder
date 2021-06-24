//
//  Stories_Previews.swift
//  RunningOrder
//
//  Created by Clément Nonn on 08/07/2020.
//  Copyright © 2020 Worldline. All rights reserved.
//

import Foundation
import CloudKit.CKRecordZone

extension Story {
    enum Previews {
        static let stories = [
            Story(
                sprintId: Sprint.Previews.sprints[0].id,
                name: "Liste des sprints",
                ticketReference: "TICKET-1",
                epic: "Epic 1",
                readyForDemo: true,
                creatorReference: nil,
                zoneId: CKRecordZone.ID()
            ),
            Story(
                sprintId: Sprint.Previews.sprints[0].id,
                name: "Créer un sprint",
                ticketReference: "TICKET-2",
                epic: "Epic 2",
                readyForDemo: true,
                creatorReference: nil,
                zoneId: CKRecordZone.ID()
            ),
            Story(
                sprintId: Sprint.Previews.sprints[0].id,
                name: "Créer une story",
                ticketReference: "TICKET-3",
                epic: "Epic 2",
                readyForDemo: true,
                creatorReference: nil,
                zoneId: CKRecordZone.ID()
            ),
            Story(
                sprintId: Sprint.Previews.sprints[0].id,
                name: "modifier une story",
                ticketReference: "TICKET-4",
                epic: "Epic 3",
                readyForDemo: true,
                creatorReference: nil,
                zoneId: CKRecordZone.ID()
            )
        ]
    }
}
