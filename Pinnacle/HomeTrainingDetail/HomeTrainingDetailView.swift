//
//  HomeTrainingDetailView.swift
//  Pinnacle
//
//  Created by D K on 01.04.2025.
//

import SwiftUI

struct HomeTrainingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var image: String
    var title: String
    var training: String
    
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
                    
                    Text("Home Training")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .black))
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                
                ScrollView {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .clipShape(Circle())
                        .shadow(color: .semiBlue, radius: 10)
                    
                    Text(title)
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .black))
                        .padding(.top)
                    
                    Text(training)
                        .padding(.horizontal)
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .regular, design: .monospaced))
                        .padding()
                        .padding(.bottom, 150)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    HomeTrainingDetailView(image: "tr1", title: "Full Body Blast", training: "10 push-ups, 15 squats, 20 jumping jacks, 10 sit-ups. Repeat 3 times with 1-minute rest between rounds.")
}
