//
//  ChatView.swift
//  biligoba
//
//  Created by Ali Amer on 8/17/23.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 75)
                .foregroundColor(.white)
            VStack (alignment: .leading){
                Text("Friend")
                    .padding(.leading, 5)
                    .font(.title2)
                    .foregroundColor(.primary)
                Text("License so that you can share this")
                    .padding(.leading, 5)
                    .font(.footnote)
                    .foregroundColor(.primary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
