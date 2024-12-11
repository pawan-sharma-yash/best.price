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
        Image(category.title)
          .resizable()
          .aspectRatio(contentMode: .fit)

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
