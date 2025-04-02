//
//  NewRewardsView.swift
//  Pinnacle
//
//  Created by D K on 01.04.2025.
//

import SwiftUI


class Reward: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    
    init(id: UUID = UUID(), image: String, title: String) {
        self.id = id
        self.image = image
        self.title = title
    }
}

struct NewRewardsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var rewards: [Reward] = [
    Reward(image: "r1", title: "Logged into the app for 10 consecutive days."),
    Reward(image: "r2", title: "Signed up for 5 workouts."),
    Reward(image: "r3", title: "Completed a workout before 8 AM."),
    Reward(image: "r4", title: "Completed 10 workouts in a row."),
    Reward(image: "r5", title: "Exercised 3 times a week for a month."),
    Reward(image: "r6", title: "Exercised in the morning 10 times."),
    Reward(image: "r7", title: "Exercised in the evening 10 times."),
    Reward(image: "r8", title: "Achieved all previous achievements.")
    ]
    
    @State private var isAlertShown = false
    
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
                    
                    Text("Rewards")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .black))
                        .padding(.trailing)
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(rewards, id: \.id) { reward in
                            Button {
                                isAlertShown.toggle()
                            } label: {
                                ZStack {
                                    Image(reward.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: size().width - 40, height: 150)
                                    
                                    Text(reward.title)
                                        .foregroundStyle(.gray)
                                        .padding(.horizontal, 40)
                                }
                                .overlay {
                                    VStack {
                                        Spacer()
                                        
                                        Text("Not Received").foregroundStyle(.white)
                                            .font(.system(size: 12))
                                            .padding()
                                            .background {
                                                Capsule()
                                                    .foregroundStyle(.black)
                                            }
                                            .shadow(color: .white, radius: 2)
                                    }
                                    
                                }
                            }
                        }
                    }
                    .padding(.bottom, 150)
                }
                .scrollIndicators(.hidden)
                .alert("Continue using the app to unlock rewards.", isPresented: $isAlertShown) {
                    Button {
                        
                    } label: {
                        Text("Ok")
                    }
                }
            }
        }
    }
}

#Preview {
    NewRewardsView()
}
