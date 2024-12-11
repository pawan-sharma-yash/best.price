//
//  SubcategoriesViewModel.swift
//  Best.Price
//
//  Created by Pawan Sharma on 11/12/2024.
//

import FirebaseFirestore
import Foundation
import Models
import OSLog
import SwiftUI

final class SubcategoriesViewModel: ObservableObject {
  @Published
  var subcategories: [ProductSubcategory] = []
  let category: ProductCategory

  init(category: ProductCategory) {
    self.category = category
    fetchFirestoreSubcategories()
  }

  private func fetchFirestoreSubcategories() {
    Task {
      do {
        // Get a reference to Firestore
        let db = Firestore.firestore()

        // Replace 'userId' with the actual user ID you want to access
        let subcategoryRef = db
          .collection("categories")
          .document(category.id)
        let snapshot = try await subcategoryRef.collection(category.title).getDocuments()
        OperationQueue.main.addOperation { [unowned self] in
          // Iterate through the documents and extract the data
          subcategories = snapshot.documents.compactMap { document -> ProductSubcategory? in
            let data = document.data()
            let id = document.documentID
            guard let title = data["title"] as? String
            else { return nil }
            return ProductSubcategory(title: title, id: id)
          }
          .sorted(by: { $0.title < $1.title })
        }
      }
    }
  }
}
