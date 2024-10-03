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

    // Store cancellable subscriptions
    private var cancellables = Set<AnyCancellable>()

    // PassthroughSubject to notify when a notification is sent (Observer Pattern)
    private let notificationSentSubject = PassthroughSubject<(NotificationFactory.NotificationType, String, String), Never>()

    init() {
        // Register as an observer in the NotificationManager
        NotificationCenterManager.shared.addObserver(self)

        // Observe sendNotificationSubject and trigger notifications
        notificationSentSubject
            .sink { [weak self] (channelType, message, recipient) in
                NotificationCenterManager.shared.sendNotification(channelType: channelType, message: message, recipient: recipient)
                self?.lastNotificationMessage = "Sent \(channelType) to \(recipient): \(message)"
            }
            .store(in: &cancellables)
    }

    deinit {
        NotificationCenterManager.shared.removeObserver(self)
    }


    func onNotificationSent(_ message: String) {
        self.lastNotificationMessage = message
    }

    // Method to trigger the notification sending
    func sendNotification(channelType: NotificationFactory.NotificationType) {
        if (!recipient.isEmpty && !message.isEmpty) {
            notificationSentSubject.send((channelType, message, recipient))
        }
    }

}
