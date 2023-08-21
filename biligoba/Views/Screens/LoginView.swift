//
//  LoginView.swift
//  biligoba
//
//  Created by Ali Amer on 8/15/23.
//

import SwiftUI

struct LoginView: View {
    @State var phone: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var isChecked: Bool = false
    @State private var passwordIsVisible: Bool = false
    @State private var isMenuShown = false
    
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                
                BackgroundColor()
                
                Group {
                    VStack(alignment: .leading, spacing: nil) {
                        HStack {
                            
                            Picker(selection: .constant(1), label: Text("Code")) {
                                Text("1").tag(1)
                                Text("2").tag(2)
                                Text("3").tag(3)
                            }
                            
                            TextField("Phone", text: $phone )
                                .frame(width: 250)
                            
                            Spacer()
                        }
                        HStack {
                            Rectangle()
                                .frame(width: 50, height: 1)
                                .foregroundColor(.black.opacity(0.4))
                            
                            
                            Rectangle()
                                .frame(width: .infinity, height: 1)
                                .foregroundColor(.black.opacity(0.4))
                        }
                        Text("OR*")
                            .font(.footnote)
                            .foregroundColor(.black.opacity(0.5))
                            .padding(.vertical, 10)
                        
                        
                        TextField("E-mail", text: $email )
                            .frame(width: .infinity)
                        Rectangle()
                            .frame(width: .infinity, height: 1)
                            .foregroundColor(.black.opacity(0.4))
                        
                        PasswordField(password: $password, placeholder: "Password")
                            .padding(.top, 30)
                        
                        HStack {
                            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    isChecked.toggle()
                                }
                            
                            Text("Keep me logged in")
                                .font(.caption2)
                            Spacer()
                            Text("Forgor Password")
                                .font(.caption)
                                .underline()
                        }
                        .padding(.top, 10)
                        
                        HStack {
                            Spacer()
                            Button {
                                // Add your action code here, for example:
                                print("Log In button tapped")
                            } label: {
                                Text("Log In")
                                    .font(.system(size: 30))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 80)
                                    .background(
                                        Color("bcolor")
                                            .cornerRadius(10)
                                            .shadow(radius: 3)
                                    )
                                
                            }
                            Spacer()
                        }
                        .padding(.top, 40)
                        
                        VStack {
                            HStack {
                                Spacer()
                                Text("Don't you have an account?")
                                    .font(.caption)
                                
                                
                                NavigationLink(destination: SignupView().navigationBarBackButtonHidden(true)) {
                                    Text("Create Account")
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                }
                                .buttonStyle(PlainButtonStyle())
                                

                                Spacer()
                            }
                            .padding(.top, 10)
                            
                            Text("Log in with")
                                .font(.caption2)
                                .padding(.top, 10)
                            
                            HStack{
                                Spacer()
                                VStack {
                                    Image("facebook")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 30)
                                    Text("Facebook")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                    
                                }
                                Spacer()
                                VStack {
                                    Image("google")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 30)
                                    Text("Google")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                VStack {
                                    Image("twitter")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 30)
                                    Text("Twitter")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                                Spacer()
                            }.padding(.top, 30)
                            
                            HStack(spacing: 10) {
                                HStack(spacing: 10) {
                                    ForEach(["En", "Fr", "Ar", "Ge"], id: \.self) { language in
                                        Text(language)
                                            .padding([.leading, .trailing], 10)
                                            .frame(width: isMenuShown ? nil : 0, alignment: .leading)
                                            .clipped()  // This will ensure that the text doesn't overflow its bounds
                                            .opacity(isMenuShown ? 1.0 : 0.0)  // Fade in and out for smoother appearance
                                    }
                                }
                                .if(isMenuShown) { view in
                                    view.overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.blue, lineWidth: 1)
                                    )
                                }
                                
                                Image(systemName: "globe.badge.chevron.backward")
                                    .font(.title)
                                    .onTapGesture {
                                        withAnimation (.easeInOut){
                                            isMenuShown.toggle()
                                        }
                                    }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.vertical, 20)
                            
                            
                            
                            
                        }
                        
                        
                        
                    }
                    .padding(.horizontal, 25)
                    .padding(.top, 150)
                    .frame(maxHeight: .infinity)
                }
                
                Image("top")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .allowsHitTesting(false)
                    .ignoresSafeArea()
            }
        }
        
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
