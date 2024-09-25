//
//  HomeView.swift
//  Restart
//
//  Created by Mayur Kore on 24/09/24.
//

import SwiftUI

struct HomeView: View {
    //MARK: PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false

    var body: some View {
        //MARK: BODY
        
        VStack(spacing: 20) {
            //MARK: HEADER
            
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeInOut(duration: 4)
                               .repeatForever()
                               , value: isAnimating)
            }
            
            
            //MARK: CENTER
            
            Text("The time that leads to mastery is dependant on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            //MARK: FOOTER
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

#Preview {
    HomeView()
}
