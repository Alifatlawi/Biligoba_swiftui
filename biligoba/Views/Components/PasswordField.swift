//
//  PasswordField.swift
//  biligoba
//
//  Created by Ali Amer on 8/20/23.
//

import SwiftUI

struct PasswordField: View {
    @Binding var password: String
    @State private var passwordIsVisible: Bool = false
    var placeholder: String

    var body: some View {
        VStack {
            HStack {
                if passwordIsVisible {
                    TextField(placeholder, text: $password)
                        .frame(width: .infinity)
                        .padding(.top, 20)
                } else {
                    SecureField(placeholder, text: $password)
                        .frame(width: .infinity)
                        .padding(.top, 20)
                }
                
                Image(systemName: passwordIsVisible ? "eye.slash" : "eye")
                    .onTapGesture {
                        passwordIsVisible.toggle()
                    }
            }
            
            Rectangle()
                .frame(width: .infinity, height: 1)
                .foregroundColor(.black.opacity(0.4))
        }
    }
}
