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
            NavigationLink(value: subcategory) {
              SubcategoryCard(subcategory: subcategory)
            }
          }
        }
        .padding()
      }
    }
    .navigationTitle(viewModel.category.title)
    .navigationDestination(for: ProductSubcategory.self) { item in
      DetialView(subcategory: item)
    }
  }
}

struct DetialView: View {
  let subcategory: ProductSubcategory
  var body: some View {
    Group {
      Text(subcategory.id)
      Text(subcategory.title)
    }
    .navigationTitle(subcategory.title)
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
