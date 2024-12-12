//
//  SubcategoryCard.swift
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
        AsyncImage(url: URL(string: subcategory.imageLink ?? "")) { phase in
          if let image = phase.image {
            image
              .resizable()
              .aspectRatio(contentMode: ContentMode.fit)
          } else if phase.error != nil {
            Color.red // Indicates an error.
          } else {
            Color.blue // Acts as a placeholder.
          }
        }
        Spacer()
        Text(subcategory.title)
          .font(.system(size: 16, weight: .medium))
          .multilineTextAlignment(.center)
          .frame(alignment: .top)
          .padding([.leading, .trailing], 4)
          .foregroundStyle(Color.black)
      }
      .padding(.bottom)
    }
    .frame(maxWidth: .infinity)
    .background(Color.white)
    .cornerRadius(8)
    .shadow(radius: 2)
  }
}
