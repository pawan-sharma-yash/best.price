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
  fileprivate enum Route {
    case unAuthenticatedUser
    case authenticatedUser
  }

  @Published fileprivate var currentRoute: Route = .unAuthenticatedUser

  func navigateToHome() {
    currentRoute = .authenticatedUser
  }

  func navigateToLogin() {
    currentRoute = .unAuthenticatedUser
  }
}

@main
struct Best_PriceApp: App {
  // https://stackoverflow.com/a/62633158/1568609
  @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

  @StateObject var router = AppRouter()

  var body: some Scene {
    WindowGroup {
      contentView()
    }
    .environmentObject(router)
  }

  @ViewBuilder
  private func contentView() -> some View {
    switch router.currentRoute {
    case .authenticatedUser:
      HomeView()
    case .unAuthenticatedUser:
      LoginView()
    }
  }
}
