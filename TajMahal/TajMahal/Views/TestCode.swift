//
//  TestCode.swift
//  TajMahal
//
//  Created by Kouassi Assoua on 28/01/2024.
//
import SwiftUI

// Définition des énumérations
enum NotifyMeAboutType {
    case directMessages, mentions, anything
}

enum ProfileImageSize {
    case large, medium, small
}

struct ContentView: View {
    // Déclaration des variables d'état
    @State private var notifyMeAbout: NotifyMeAboutType = .directMessages
    @State private var playNotificationSounds = false
    @State private var sendReadReceipts = false
    @State private var profileImageSize: ProfileImageSize = .medium

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Notifications")) {
                    Picker("Notify Me About", selection: $notifyMeAbout) {
                        Text("Direct Messages").tag(NotifyMeAboutType.directMessages)
                        Text("Mentions").tag(NotifyMeAboutType.mentions)
                        Text("Anything").tag(NotifyMeAboutType.anything)
                    }
                    Toggle("Play notification sounds", isOn: $playNotificationSounds)
                    Toggle("Send read receipts", isOn: $sendReadReceipts)
                }
                Section(header: Text("User Profiles")) {
                    Picker("Profile Image Size", selection: $profileImageSize) {
                        Text("Large").tag(ProfileImageSize.large)
                        Text("Medium").tag(ProfileImageSize.medium)
                        Text("Small").tag(ProfileImageSize.small)
                    }
                    Button("Clear Image Cache") {}
                }
            }
        }
    }
}

/*
struct ContentView: View {
    var body: some View {
        NavigationView {
            List(1..<10) { index in
                NavigationLink(destination: Text("Item #\(index)")) {
                    Text("Item #\(index)")
                }
            }
            .navigationTitle("Demo")
            .listRowSpacing(10)
        }
    }
}*/
/*
struct ContentView: View {/*
    var body: some View {
        NavigationView {
            List(1..<50) { index in
                ZStack(alignment: .leading) {
                    NavigationLink(
                        destination: Text("Item #\(index)")) {
                            EmptyView()
                        }
                        .opacity(1)
                    Text("Item #\(index)")
                    Image(systemName: "globe")
                }
            }
            .navigationTitle("Demo")
            .listRowSpacing(10)
        }
    }*/
    
 var body: some View {
     NavigationView {
         Form {
             Section(header: Text("Notifications")) {
                 Picker("Notify Me About", selection: $notifyMeAbout) {
                     Text("Direct Messages").tag(NotifyMeAboutType.directMessages)
                     Text("Mentions").tag(NotifyMeAboutType.mentions)
                     Text("Anything").tag(NotifyMeAboutType.anything)
                 }
                 Toggle("Play notification sounds", isOn: $playNotificationSounds)
                 Toggle("Send read receipts", isOn: $sendReadReceipts)
             }
             Section(header: Text("User Profiles")) {
                 Picker("Profile Image Size", selection: $profileImageSize) {
                     Text("Large").tag(ProfileImageSize.large)
                     Text("Medium").tag(ProfileImageSize.medium)
                     Text("Small").tag(ProfileImageSize.small)
                 }
                 Button("Clear Image Cache") {}
             }
         }
     }
 }
*/
/*import SwiftUI

struct ContentView: View {
    @State private var currentView: String = "home"
    @State private var toggleState = false
      @State private var textFieldValue = ""

    var body: some View {
        VStack {
            if currentView == "home" {
                HomeView(currentView: $currentView)
            } else if currentView == "settings" {
                SettingsView(currentView: $currentView)
            }
            Form {
                Section(header: Text("Section 1")) {
                    Text("Option 1")
                    Toggle(isOn: $toggleState) {
                        Text("Toggle")
                    }
                }
                Section(header: Text("Section 2")) {
                    TextField("Enter text", text: $textFieldValue)
                }
            }//.formStyle(.)

        }
    }
    
    
}

struct HomeView: View {
    @Binding var currentView: String

    var body: some View {
        VStack {
            Text("Home View")
            Button("Go to Settings") {
                currentView = "settings"
            }
        }
    }
}

struct SettingsView: View {
    @Binding var currentView: String

    var body: some View {
        VStack {
            Text("Settings View")
            Button("Back to Home") {
                currentView = "home"
            }
        }
    }
}*/



#Preview {
    ContentView()
}
