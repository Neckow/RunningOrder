//
//  Story+CloudKit.swift
//  RunningOrder
//
//  Created by Lucas Barbero on 20/08/2020.
//  Copyright © 2020 Worldline. All rights reserved.
//

import Foundation
import CloudKit

extension Story: CKRecordable {

    init(from record: CKRecord) throws {
        self.name = try record.property("name")
        self.ticketReference = try record.property("ticketReference")
        self.epic = try record.property("epic")
        self.readyForDemo = try record.property("readyForDemo")

        let sprintReference: CKRecord.Reference = try record.property("sprintId")
        self.sprintId = sprintReference.recordID.recordName
        self.zoneId = record.recordID.zoneID

        if let id = record.creatorUserRecordID {
            self.creatorReference = User.Reference(recordId: id)
        } else {
            self.creatorReference = nil
        }
    }

    func encode() -> CKRecord {
        let storyRecord = CKRecord(recordType: RecordType.story.rawValue, recordID: recordId(zoneId: zoneId))

        storyRecord["name"] = self.name
        storyRecord["ticketReference"] = self.ticketReference
        storyRecord["epic"] = self.epic
        storyRecord["readyForDemo"] = self.readyForDemo
         storyRecord["sprintId"] = CKRecord.Reference(recordID: sprintRecordId(zoneId: zoneId), action: .deleteSelf)

        storyRecord.parent = CKRecord.Reference(recordID: sprintRecordId(zoneId: zoneId), action: .none)

        return storyRecord
    }

    private func recordId(zoneId: CKRecordZone.ID) -> CKRecord.ID {
        return CKRecord.ID(recordName: self.id, zoneID: zoneId)
    }

    private func sprintRecordId(zoneId: CKRecordZone.ID) -> CKRecord.ID {
        return CKRecord.ID(recordName: self.sprintId, zoneID: zoneId)
    }
}
