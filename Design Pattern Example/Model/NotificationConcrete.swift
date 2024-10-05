//
//  NotificationType.swift
//  Design Pattern Example
//
//  Created by KhuePM on 03/10/2024.
//

import Foundation

protocol NotificationChannel {
    func sendMessage(notification: Notification)
}

// Email Notification Channel
class EmailNotification: NotificationChannel {
    func sendMessage(notification: Notification) {
        print("Email sent at \(notification.timestamp) with message: \(notification.message) to \(notification.recipient)")
        // Email sending logic
    }
}

// SMS Notification Channel
class SMSNotification: NotificationChannel {
    func sendMessage(notification: Notification) {
        print("SMS sent at \(notification.timestamp) with message: \(notification.message) to \(notification.recipient)")
        // SMS sending logic
    }
}

// Push Notification Channel
class PushNotification: NotificationChannel {
    func sendMessage(notification: Notification) {
        print("Notification pushed at \(notification.timestamp) with message: \(notification.message)")
        // Push notification logic
    }
}
