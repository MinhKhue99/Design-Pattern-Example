//
//  NotificationCenterManager.swift
//  Design Pattern Example
//
//  Created by KhuePM on 03/10/2024.
//

import Foundation

class NotificationCenterManager {
    static let shared = NotificationCenterManager()

    private init() {}

    private var notificationManager = NotificationManager()

    func sendNotification(notification: Notification) {
        notificationManager.sendNotification(notification: notification)
    }

    func addObserver(_ observer: NotificationObserver) {
        notificationManager.addObserver(observer)
    }

    func removeObserver(_ observer: NotificationObserver) {
        notificationManager.removeObserver(observer)
    }
}
