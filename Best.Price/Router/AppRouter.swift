//
//  AppRouter.swift
//  Best.Price
//
//  Created by Pawan Sharma on 05/12/2024.
//

import Foundation
import SwiftUI

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

extension Best_PriceApp {
  fileprivate func unAuthenticatedUserFlow() -> some View {
    TabView {
      CategoriesView()
        .tabItem {
          Image(systemName: "house")
          Text("Home")
        }
      CategoriesView()
        .tabItem {
          Image(systemName: "squareshape.split.2x2")
          Text("Categories")
        }
      LoginView()
        .tabItem {
          Image(systemName: "person.circle.fill")
          Text("Login Now")
        }
      CategoriesView()
        .tabItem {
          Image(systemName: "percent")
          Text("Offers")
        }
      CategoriesView()
        .tabItem {
          Image(systemName: "phone.circle")
          Text("Help")
        }
    }
  }

  fileprivate func authenticatedUserFlow() -> some View {
    TabView {
      CategoriesView()
        .tabItem {
          Image(systemName: "house")
          Text("Home")
        }
      CategoriesView()
        .tabItem {
          Image(systemName: "squareshape.split.2x2")
          Text("Categories")
        }
      CategoriesView()
        .tabItem {
          Image(systemName: "percent")
          Text("Offers")
        }
      CategoriesView()
        .tabItem {
          Image(systemName: "creditcard.circle")
          Text("Free Credit")
        }
      CategoriesView()
        .tabItem {
          Image(systemName: "list.bullet")
          Text("Orders")
        }
    }
  }

  @ViewBuilder
  func contentView() -> some View {
    switch router.currentRoute {
    case .authenticatedUser:
      authenticatedUserFlow()
    case .unAuthenticatedUser:
      unAuthenticatedUserFlow()
    }
  }
}
