//
//  HomeView.swift
//  biligoba
//
//  Created by Ali Amer on 8/17/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            
            BackgroundColor()
            
            VStack {
                ScrollView {
                    Spacer()
                        .frame(height: 90)
                    ForEach (0..<10) {index in
                        ChatView()
                        
                        Rectangle()
                            .frame(width: 300, height: 1)
                            .foregroundColor(.black.opacity(0.3))
                    }
                }
            }
            
            FloatingActionButton()
                .offset(x: 155, y: 380)
            Image("top2")
                .resizable()
                .scaleEffect(2.2)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea()
            .offset(x: 70, y: -540)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CustomCircleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let diameter = min(rect.width, rect.height)
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: diameter / 2, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: diameter / 2, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: -90), clockwise: false)

        return path
    }
}


struct FloatingActionButton: View {
    var body: some View {
        Button(action: {
            // Handle button tap here
        }) {
            ZStack {
                CustomCircleShape()
                    .fill(Color.blue)
                
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
            }
            .frame(width: 60, height: 60)
        }
    }
}

