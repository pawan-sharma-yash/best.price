//
//  HomeViewModel.swift
//  Best.Price
//
//  Created by Pawan Sharma on 03/12/2024.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import OSLog

struct Category {
  let title: String
  let iconURL: String
}

final class CategoriesViewModel: ObservableObject {
  init() {
    fetchFirestoreCategories()
  }

  private func fetchFirestoreCategories() {
    Task {
      do {
        // Get a reference to Firestore
        let db = Firestore.firestore()
        // Get a reference to the "categories" collection
        let categoriesCollection = db.collection("categories")
        let snapshot = try await categoriesCollection.getDocuments()

        // Iterate through the documents and extract the data
        let categories = snapshot.documents.compactMap { document -> Category? in
          guard let title = document.data()["title"] as? String,
                let iconURL = document.data()["icon-url"] as? String else {
            return nil
          }
          return Category(title: title, iconURL: iconURL)
        }

        // Process the fetched categories
        processCategories(categories)
      } catch {
        Logger.general.debug("Error fetching Firestore categories: \(error.localizedDescription)")
      }
    }
  }

  private func processCategories(_ categories: [Category]) {
    // Handle the fetched categories here
    for category in categories {
      print("Category: \(category.title), Icon URL: \(category.iconURL)")
    }
  }
}
