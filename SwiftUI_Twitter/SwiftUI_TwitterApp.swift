//
//  SwiftUI_TwitterApp.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 17.02.2023.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
    
    override init() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
    
    
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    return true
  }
}

@main
struct SwiftUI_TwitterApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @ObservedObject var authViewModel: AuthViewModel = AuthViewModel()
    @ObservedObject var userViewModel: UserViewModel = UserViewModel()

    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(authViewModel)
            .environmentObject(userViewModel)
        }
    }
}

