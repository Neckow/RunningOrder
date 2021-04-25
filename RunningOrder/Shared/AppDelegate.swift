//
//  AppDelegate.swift
//  RunningOrder
//
//  Created by Clément Nonn on 23/06/2020.
//  Copyright © 2020 Worldline. All rights reserved.
//

import Cocoa
import CloudKit
import Combine
import UserNotifications

class AppDelegate: NSObject, NSApplicationDelegate {

    private var cancellables = Set<AnyCancellable>()

    let cloudkitContainer = CloudKitContainer.shared
    var spaceManager: SpaceManager?
    weak var changesService: CloudKitChangesService?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        registerForPushNotification()
    }

    func application(_ application: NSApplication, userDidAcceptCloudKitShareWith metadata: CKShare.Metadata) {
        spaceManager?.acceptShare(metadata: metadata)
    }

    func application(_ application: NSApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        Logger.error.log(error)
    }

    func application(_ application: NSApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Logger.verbose.log("notifications token : \(deviceToken)")
    }

    private func registerForPushNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: []) { granted, error in
            if let error = error {
                Logger.error.log(error)
            } else {
                Logger.verbose.log("notifications grant status : \(granted)")
            }
        }
        NSApplication.shared.registerForRemoteNotifications()
    }

    func application(_ application: NSApplication, didReceiveRemoteNotification userInfo: [String: Any]) {
        // TODO: re do this
        guard cloudkitContainer.validateNotification(userInfo) else { return }

        // how to fetch the recordZoneId ??
//        changesService?.fetchChanges(on: )
    }
}
