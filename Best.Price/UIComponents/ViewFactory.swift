//
//  EmailInputField.swift
//  Best.Price
//
//  Created by Pawan Sharma on 28/10/23.
//

import Foundation
import SwiftUI

struct EmailInputField: View {
  @Binding var text: String

  var body: some View {
    HStack {
      Image(systemName: "envelope")
      TextField("Email Address", text: $text)
        .frame(height: 40.0)
        .autocapitalization(.none)
        .keyboardType(.emailAddress)
        .textContentType(.emailAddress)
    }
  }
}

struct PasswordInputField: View {
  @Binding var text: String

  var body: some View {
    HStack {
      Image(systemName: "lock")
      SecureField("Password", text: $text)
        .frame(height: 40.0)
        .textContentType(.password)
    }
  }
}

enum ViewFactory {
  static func avatarView(
    width: CGFloat = 150,
    height: CGFloat = 150,
    alignment: Alignment = .center
  ) -> some View {
    HStack {
      Spacer()
      Image(systemName: "person.crop.circle.fill")
        .resizable()
        .frame(width: width, height: height, alignment: alignment)
        .foregroundColor(.blue)
      Spacer()
    }
  }
}
