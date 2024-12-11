//
//  CategoryCard 2.swift
//  Best.Price
//
//  Created by Pawan Sharma on 11/12/2024.
//


//
//  CategoryCard.swift
//  Best.Price
//
//  Created by Pawan Sharma on 09/12/24.
//
import SwiftUI
import Models

struct SubcategoryCard: View {
  let subcategory: ProductSubcategory

  var body: some View {
    ZStack {
      VStack {
        Image(subcategory.title)
          .resizable()
          .aspectRatio(contentMode: .fit)

        Spacer()
        Text(subcategory.title)
          .font(.system(size: 16, weight: .medium))
          .multilineTextAlignment(.center)
          .frame(alignment: .top)
          .padding([.leading, .trailing], 4)
      }
      .padding(.bottom)
    }
    .frame(maxWidth: .infinity)
    .background(Color.white)
    .cornerRadius(8)
    .shadow(radius: 2)
  }
}
