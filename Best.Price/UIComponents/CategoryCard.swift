//
//  CategoryCard.swift
//  Best.Price
//
//  Created by Pawan Sharma on 09/12/24.
//
import SwiftUI
import Models

struct CategoryCard: View {
  let category: ProductCategory

  var body: some View {
    ZStack {
      VStack {
        AsyncImage(url: URL(string: category.iconURL)) { image in
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
        } placeholder: {
          Image("placeholder-image")
            .resizable()
            .aspectRatio(contentMode: .fit)
        }

        Spacer()
        Text(category.title)
          .font(.system(size: 16, weight: .medium))
          .multilineTextAlignment(.center)
          .frame(alignment: .top)
      }
      .padding(.bottom)
    }
    .frame(maxWidth: .infinity)
    .background(Color.white)
    .cornerRadius(8)
    .shadow(radius: 2)
  }
}
