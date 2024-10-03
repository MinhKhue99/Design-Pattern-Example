//
//  NotificationType.swift
//  Design Pattern Example
//
//  Created by KhuePM on 03/10/2024.
//

import Foundation

protocol NotificationChannel {
    func sendMessage(_ message: String, to recipient: String)
}

// Email Notification Channel
class EmailNotification: NotificationChannel {
    func sendMessage(_ message: String, to recipient: String) {
        print("Sending Email: \(message) to \(recipient)")
        // Email sending logic
    }
}

// SMS Notification Channel
class SMSNotification: NotificationChannel {
    func sendMessage(_ message: String, to recipient: String) {
        print("Sending SMS: \(message) to \(recipient)")
        // SMS sending logic
    }
}

// Push Notification Channel
class PushNotification: NotificationChannel {
    func sendMessage(_ message: String, to recipient: String) {
        print("Sending Push Notification: \(message) to \(recipient)")
        // Push notification logic
    }
}
