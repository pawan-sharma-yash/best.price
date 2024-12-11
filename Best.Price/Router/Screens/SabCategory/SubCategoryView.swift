//
//  SubCategory.swift
//  Best.Price
//
//  Created by Pawan Sharma on 10/12/2024.

import SwiftUI

struct Item: Identifiable, Hashable {
  let id = UUID()
  let name: String
}

struct SubCategoryView: View {
  let items = [
    Item(name: "Item 1"),
    Item(name: "Item 2"),
    Item(name: "Item 3")
  ]

  @State private var navigationPath = NavigationPath()

  var body: some View {
    NavigationStack(path: $navigationPath) {
      ScrollView {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 20.0) {
          ForEach(items) { item in
            NavigationLink(value: item) {
              VStack {
                Image("placeholder-image")
                  .resizable()
                  .frame(width: 120, height: 120, alignment: .center)
                Text(item.name)
                  .frame(maxWidth: .infinity)
              }
            }
          }
        }
        .padding()
      }
      .navigationTitle("Grid Items")
      .navigationDestination(for: Item.self) { item in
        DetailView(item: item)
      }
    }
  }
}

struct DetailView: View {
  var item: Item

  var body: some View {
    VStack {
      Text("Detail for \(item.name)")
        .font(.largeTitle)
        .padding()
    }
    .navigationTitle(item.name)
  }
}

#Preview {
  SubCategoryView()
}
