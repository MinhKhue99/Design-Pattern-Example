//
//  Notification.swift
//  Design Pattern Example
//
//  Created by KhuePM on 05/10/2024.
//

import Foundation

struct Notification {
    let type: NotificationType
    let message: String
    let recipient: String
    let timestamp: Date
}

enum NotificationType: String, CaseIterable, Identifiable {
    case email = "Email"
    case sms = "SMS"
    case push = "Push Notification"
    
    var id: String { self.rawValue }
}
