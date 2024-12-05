//
//  Best_PriceApp.swift
//  Best.Price
//
//  Created by Pawan Sharma on 22/09/23.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

final class AppRouter: ObservableObject {
  @Published var currentView: String = "LoginView" // Default to LoginView

  func navigateToHome() {
    currentView = "HomeView"
  }

  func navigateToLogin() {
    currentView = "LoginView"
  }
}

@main
struct Best_PriceApp: App {
  // https://stackoverflow.com/a/62633158/1568609
  @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

  @StateObject var router = AppRouter()

  var body: some Scene {
    WindowGroup {
      NavigationStack {
        switch router.currentView {
        case "HomeView":
          HomeView()
            .onAppear { /* Load user data */ }
        case "LoginView":
          LoginView()
            .onAppear { /* Prepare login */ }
        default:
          LoginView()
        }
      }
    }
    .environmentObject(router)
  }
}
