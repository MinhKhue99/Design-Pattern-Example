//
//  NotificationManager.swift
//  Design Pattern Example
//
//  Created by KhuePM on 03/10/2024.
//

import Foundation
import Combine

// Notification Observer Protocol
protocol NotificationObserver: AnyObject {
    func onNotificationSent(_ message: String)
}

/// - NotificationManager that use Observer pattern to observe when notifications need to be sent, and trigger the appropriate notifications based on changes

class NotificationManager {

    private var observers: [NotificationObserver] = []

    func addObserver(_ observer: NotificationObserver) {
        observers.append(observer)
    }

    func removeObserver(_ observer: NotificationObserver) {
        observers = observers.filter { $0 !== observer }
    }

    func notifyObservers(_ message: String) {
        for observer in observers {
            observer.onNotificationSent(message)
        }
    }

    func sendNotification(channelType: NotificationFactory.NotificationType, message: String, recipient: String) {
        let channel = NotificationFactory.createNotificationChanel(type: channelType)
        channel.sendMessage(message, to: recipient)
        notifyObservers(message)
    }
}
