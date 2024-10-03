//
//  NotificationFactory.swift
//  Design Pattern Example
//
//  Created by KhuePM on 03/10/2024.
//

import Foundation

/// - A factory that creates notification types based on user selection

class NotificationFactory {

    enum NotificationType {
        case email
        case sms
        case push
    }

    static func createNotificationChanel(type: NotificationType) -> NotificationChannel {
        switch type {
        case .email:
            return EmailNotification()
        case .sms:
            return SMSNotification()
        case .push:
            return PushNotification()
        }
    }
}
