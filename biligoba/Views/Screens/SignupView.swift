//
//  SignupView.swift
//  biligoba
//
//  Created by Ali Amer on 8/20/23.
//

import SwiftUI

struct SignupView: View {
    @State var phone: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmpassword: String = ""
    @State var isChecked: Bool = false
    @State private var isMenuShown = false
    var body: some View {
        ZStack {
            BackgroundColor()
            
            
            VStack (alignment: .leading, spacing: nil) {
                HStack {
                    Picker(selection: .constant(1), label: Text("Code")) {
                        Text("1")
                        Text("2")
                        Text("3")
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
                
                Group {
                    
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
                    PasswordField(password: $confirmpassword, placeholder: "Confirm Password")
                    
                }
                
                HStack {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            isChecked.toggle()
                        }
                    
                    Text("I Aggree ")
                        .font(.footnote)
                    Button("Terms and conditions") {
                        
                    }
                    .font(.footnote)
                }
                
                HStack {
                    Spacer()
                    Button {
                        // Add your action code here, for example:
                        print("Log In button tapped")
                    } label: {
                        Text("Create Account")
                            .font(.title.weight(.bold))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 50)
                            .background(
                                Color("bcolor")
                                    .cornerRadius(10)
                                    .shadow(radius: 3)
                            )
                        
                    }
                    Spacer()
                }
                .padding(.top, 40)
                
                HStack{
                    Spacer()
                    Text("Are you already a member ?")
                        .font(.footnote)
                    Button("Log in"){
                        
                    }
                    .font(.footnote)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("Log in with")
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.top)
                
                Group {
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
                    }.padding(.top)
                }
                
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
            .padding(.horizontal, 25)
            .padding(.top, 150)
            .frame(maxHeight: .infinity)
            
            
            
            Image("top")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .allowsHitTesting(false)
                .ignoresSafeArea()
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
