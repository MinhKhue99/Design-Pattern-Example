//
//  ContentView.swift
//  Design Pattern Example
//
//  Created by KhuePM on 03/10/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NotificationViewModel()
    @State private var selectedChannel: NotificationFactory.NotificationType = .email

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Picker("Channel", selection: $selectedChannel) {
                    Text("Email").tag(NotificationFactory.NotificationType.email)
                    Text("SMS").tag(NotificationFactory.NotificationType.sms)
                    Text("Push Notification").tag(NotificationFactory.NotificationType.push)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)

                // Text Field for Recipient
                TextField("Recipient", text: $viewModel.recipient)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                // Text Field for Message
                TextField("Message", text: $viewModel.message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                // Send Notification Button
                Button(action: {
                    viewModel.sendNotification(channelType: selectedChannel)
                }) {
                    Text("Send Notification")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.horizontal)

                // Display last sent notification
                if !viewModel.lastNotificationMessage.isEmpty {
                    Text("Last Sent Notification: \(viewModel.lastNotificationMessage)")
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.horizontal)
                }

                Spacer()
            }
            .navigationTitle("Notification System")
        }
    }
}

#Preview {
    ContentView()
}
