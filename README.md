# Notification System
This repository implements a Notification System that sends messages through various channels: Email, SMS, and Push Notifications. The system leverages three key design patterns-Factory, Singleton, and Observer-using Swift, SwiftUI, and Combine to demonstrate a scalable architecture for handling multi-channel messaging in iOS applications.
## Table of Contents
- Introduction
- Design Patterns Included
- Technologies
- Setup
- Usage
### Introduction
In modern applications, it's common to send notifications through multiple channels such as email, SMS, and push notifications. This repository demonstrates how to design such a system using established design patterns to ensure the codebase is modular, maintainable, and scalable. By using the Factory, Singleton, and Observer patterns, this system ensures the flexibility to add new notification channels with minimal changes.
### Design Patterns Included
1. Factory Pattern
```The Factory Pattern is used to create notification senders for different channels (Email, SMS, Push Notification) without exposing the creation logic to the client.```
- Use Case: When the system needs to send notifications via different channels but doesn't need to know the concrete implementation details.
- Example: A factory that creates a NotificationSender object based on the specified channel type.
2. Singleton Pattern
```The Singleton Pattern ensures that there is only one instance of the notification manager responsible for coordinating the sending of messages.```
- Use Case: When a single instance of a notification manager is needed to manage the notification dispatch logic across the app.
- Example: A global NotificationManager that handles the creation of senders and dispatching of notifications.
3. Observer Pattern
```The Observer Pattern is used to notify various parts of the app when a new message is sent or when the status of a message changes (e.g., sent, failed, received).```
- Use Case: When different components need to be notified about changes in the state of the notification process.
- Example: Using Combine to notify the UI or logging systems when a notification is successfully delivered or when an error occurs.
### Technologies
- Swift: The core programming language used for building the system.
- SwiftUI: For building the user interface.
- Combine: For managing reactive programming and notification flows, particularly with the Observer pattern.
### Setup
1. Clone the repository
```
git clone https://github.com/MinhKhue99/Design-Pattern-Example.git
cd Design-Pattern-Example
```
2. Open the project in Xcode
- Open ```Design-Pattern-Example.xcodeproj``` or ```Design-Pattern-Example.xcworkspace``` in Xcode.
- Ensure you have Xcode 15 or later to utilize SwiftUI and Combine effectively.
3. Build and run the project
- Choose a simulator or device and press Run to build and execute the app.
- Make sure the simulator or device is running iOS version 17.2 or higher.
### Usage
To explore the notification system:
1. Open the project and review the following key components:
- NotificationManager: A singleton that coordinates the sending of notifications.
- NotificationFactory: Implements the Factory pattern to create notification senders for different channels (EmailSender, SMSSender, PushNotificationSender).
- Combine Publishers and Subscribers: Implement the Observer pattern to react to changes in notification status.
2. Run the app and use the interface to trigger notifications through different channels. Observe how the system dynamically chooses the correct sender based on the selected channel.
