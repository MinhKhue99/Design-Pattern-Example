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
    func didSendNotification(notification: Notification)
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

    func notifyObservers(notification: Notification) {
        for observer in observers {
            observer.didSendNotification(notification: notification)
        }
    }

    func sendNotification(notification: Notification) {
        let channel = NotificationFactory.createNotificationChanel(type: notification.type)
        channel.sendMessage(notification: notification)
        notifyObservers(notification: notification)
    }
}
