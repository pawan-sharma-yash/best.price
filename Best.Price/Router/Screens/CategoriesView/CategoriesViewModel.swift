//
//  CategoriesViewModel.swift
//  Best.Price
//
//  Created by Pawan Sharma on 03/12/2024.
//

import FirebaseFirestore
import Foundation
import Models
import OSLog
import SwiftUI

final class CategoriesViewModel: ObservableObject {
  @Published
  var categories: [ProductCategory] = []

  init() {
    fetchFirestoreCategories()
  }

  nonisolated private func fetchFirestoreCategories() {
  private func fetchFirestoreCategories() {
    Task {
      do {
        // Get a reference to Firestore
        let db = Firestore.firestore()
        // Get a reference to the "categories" collection
        let categoriesCollection = db.collection("categories")
        let snapshot = try await categoriesCollection.getDocuments()

        OperationQueue.main.addOperation { [unowned self] in
          // Iterate through the documents and extract the data
          categories = snapshot.documents.compactMap { document -> ProductCategory? in
            let data = document.data()
            let id = document.documentID
            guard let title = data["title"] as? String,
                  let iconURL = data["icon-url"] as? String
            else { return nil }
            return ProductCategory(title: title, iconURL: iconURL, id: id)
          }
        }
      }
    }
  }
}
