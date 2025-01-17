//
//  SignInWithAppleButton.swift
//  TasksApp
//
//  Created by Efe Mazlumoğlu on 14.11.2020.
//

import Foundation
import SwiftUI
import AuthenticationServices

// Implementation courtesy of https://stackoverflow.com/questions/56850908/listen-for-environment-changes
struct SignInWithAppleButton: View {
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  
  var body: some View {
    Group {
      if colorScheme == .light {
        SignInWithAppleButtonInternal(colorScheme: .light)
      }
      else {
        SignInWithAppleButtonInternal(colorScheme: .dark)
      }
    }
  }
}

fileprivate struct SignInWithAppleButtonInternal: UIViewRepresentable {
  var colorScheme: ColorScheme
  
  func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
    switch colorScheme {
    case .light:
      return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    case .dark:
      return ASAuthorizationAppleIDButton(type: .signIn, style: .white)
    @unknown default:
      return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
  }
  
  func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
  }
}

struct SignInWithAppleButton_Previews: PreviewProvider {
  static var previews: some View {
    SignInWithAppleButton()
  }
}
