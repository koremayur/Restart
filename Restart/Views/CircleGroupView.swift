//
//  CircleGroupView.swift
//  Restart
//
//  Created by Mayur Kore on 25/09/24.
//

import SwiftUI

struct CircleGroupView: View {
    //MARK: PROPERTY
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    //MARK: BODY

    var body: some View {
        ZStack() {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }//: ZSTACK
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 0.5), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    ZStack {
        Color("ColorBlue")
            .ignoresSafeArea()
        
        CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
    }
}
