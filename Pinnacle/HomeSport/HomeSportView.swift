//
//  HomeSportView.swift
//  Pinnacle
//
//  Created by D K on 01.04.2025.
//

import SwiftUI

struct HomeSportView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedIndex = 0
    let images: [String] = ["tr1", "tr2", "tr3", "tr4", "tr5", "tr6", "tr7"]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.darkBlue)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        ZStack {
                            Image("tabIcon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                            
                            Image(systemName: "xmark")
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.bottom, 6)
                        }
                    }
                    .padding(.top, 5)
                    
                    Spacer()
                    
                    Text("Home Trainings")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .black))
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                
                Spacer()
                
                Text("Choose a workout and start training right now!")
                    .foregroundStyle(.white)
                    .font(.system(size: 24))
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                CardSportView(images: images, selectedCardIndex: $selectedIndex, imageSize: CGSize(width: size().width / 1.5, height: size().height / 1.6))
                
                Spacer()
            }
        }
    }
}

#Preview {
    HomeSportView()
}
