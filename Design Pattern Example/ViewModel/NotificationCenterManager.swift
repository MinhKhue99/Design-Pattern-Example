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

    func sendNotification(channelType: NotificationFactory.NotificationType, message: String, recipient: String) {
        notificationManager.sendNotification(channelType: channelType, message: message, recipient: recipient)
    }

    func addObserver(_ observer: NotificationObserver) {
        notificationManager.addObserver(observer)
    }

    func removeObserver(_ observer: NotificationObserver) {
        notificationManager.removeObserver(observer)
    }
}
