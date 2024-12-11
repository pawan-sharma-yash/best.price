//
//  SubCategory.swift
//  Best.Price
//
//  Created by Pawan Sharma on 10/12/2024.

import SwiftUI
import Models

struct SubCategoryView: View {
  @StateObject var viewModel: SubcategoriesViewModel

  var body: some View {
    VStack(spacing: 0) {
      // Grid
      ScrollView {
        LazyVGrid(columns: [
          GridItem(.flexible()),
          GridItem(.flexible()),
          GridItem(.flexible()),
        ], spacing: 16) {
          ForEach(viewModel.subcategories) { subcategory in
            SubcategoryCard(subcategory: subcategory)
          }
        }
        .padding()
      }
    }
    .navigationTitle(viewModel.category.title)
  }
}

#Preview {
  SubCategoryView(
    viewModel: SubcategoriesViewModel(
      category: ProductCategory(
        title: "Beverage",
        id: "abc"
      )
    )
  )
}
