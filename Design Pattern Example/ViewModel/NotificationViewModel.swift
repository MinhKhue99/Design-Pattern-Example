//
//  NotificationViewModel.swift
//  Design Pattern Example
//
//  Created by KhuePM on 03/10/2024.
//

import Foundation
import Combine

/// - NotificationViewModel
/// - uses Combine to monitor changes in message content and recipient, and notifies subscribers when a new notification is sent
/// - PassthroughSubject, @Published properties, and subscriptions to create a reactive flow. This setup can provide a more robust way of observing state changes, handling asynchronous operations, and processing inputs from the UI
class NotificationViewModel: ObservableObject, NotificationObserver {

    @Published var lastNotificationMessage: String = ""
    @Published var recipient: String = ""
    @Published var message: String = ""
    @Published var statusMessage: String = ""
    @Published var selectedType: NotificationType = .email

    // Store cancellable subscriptions
    private var cancellables = Set<AnyCancellable>()

    // PassthroughSubject to notify when a notification is sent (Observer Pattern)
    private let notificationSentSubject = PassthroughSubject<(Notification), Never>()

    init() {
        // Register as an observer in the NotificationManager
        NotificationCenterManager.shared.addObserver(self)

        // Observe sendNotificationSubject and trigger notifications
        notificationSentSubject
            .sink { [weak self] (notification) in
                NotificationCenterManager.shared.sendNotification(notification: notification)
                self?.lastNotificationMessage = "Sent \(notification.type) to \(notification.recipient): \(notification.message) at \(notification.timestamp)"
                self?.statusMessage = "\(notification.type) notification sent successfully!"
            }
            .store(in: &cancellables)
    }

    deinit {
        NotificationCenterManager.shared.removeObserver(self)
    }

    func didSendNotification(notification: Notification) {
        self.lastNotificationMessage = notification.message
    }

    // Method to trigger the notification sending
    func sendNotification() {
        guard !message.trimmingCharacters(in: .whitespaces).isEmpty else {
            statusMessage = "Message cannot be empty."
            return
        }
        let notification = Notification(type: selectedType, message: message, recipient: recipient, timestamp: Date())
        notificationSentSubject.send(notification)
    }

}
