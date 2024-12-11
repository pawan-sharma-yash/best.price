//
//  CategoriesView.swift
//  Best.Price
//
//  Created by Pawan Sharma on 03/12/2024.
//

import SwiftUI
import Models

struct CategoriesView: View {
  @StateObject private var vm = CategoriesViewModel()
  @State private var navigationPath = NavigationPath()

  var body: some View {
    NavigationStack(path: $navigationPath) {
      VStack(spacing: 0) {
        // Grid
        ScrollView {
          LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
          ], spacing: 16) {
            ForEach(vm.categories) { category in
              NavigationLink(value: category) {
                CategoryCard(category: category)
              }
            }
          }
          .padding()
        }
      }
      .navigationBarTitle("Categories")
      .navigationDestination(for: ProductCategory.self) { item in
        SubCategoryView(viewModel: SubcategoriesViewModel(category: item))
      }
      .navigationBarItems(trailing: Button(action: {
        // Action for the bar button item
      }) {
        Image(systemName: "magnifyingglass")
          .font(.subheadline)
      })
    }
  }
}

#Preview {
  CategoriesView()
}
