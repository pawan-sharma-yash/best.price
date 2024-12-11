//
//  CategoriesView.swift
//  Best.Price
//
//  Created by Pawan Sharma on 03/12/2024.
//

import SwiftUI

struct CategoriesView: View {
  @StateObject private var vm = CategoriesViewModel()
  var body: some View {
    NavigationStack {
      VStack(spacing: 0) {
        // Grid
        ScrollView {
          LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
          ], spacing: 16) {
            ForEach(vm.categories) { category in
              CategoryCard(category: category)
            }
          }
          .padding()
        }
      }
      .navigationBarTitle("Categories")
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
