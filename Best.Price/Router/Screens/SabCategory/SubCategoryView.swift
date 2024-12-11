//
//  SubCategory.swift
//  Best.Price
//
//  Created by Pawan Sharma on 10/12/2024.

import SwiftUI
import Models

struct SubCategoryView: View {
  let category: ProductCategory
  var body: some View {
    Group {
      Text(category.title)
    }
    .navigationTitle(category.title)
  }
}

#Preview {
  SubCategoryView(category: .init(title: "Beverage", id: "abc"))
}
