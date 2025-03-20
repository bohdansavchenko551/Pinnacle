//
//  ChallangeView.swift
//  Pinnacle
//
//  Created by D K on 20.03.2025.
//

import SwiftUI

struct ChallangeView: View {
    
    @State private var isNotifShown = false
    @State private var isCompleted = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.darkBlue)
                .ignoresSafeArea()
            
            VStack {
                Text("Your Daily \nChallange")
                    .foregroundStyle(.white)
                    .font(.system(size: 32, weight: .thin))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                    .overlay {
                        HStack {
                            Spacer()
                            
                            Button {
                                isNotifShown.toggle()
                            } label: {
                                Image(systemName: "bell")
                            }
                            .foregroundStyle(.white)
                        }
                        .frame(width: size().width - 40)
                        .padding(.bottom)
                    }
                
                HStack(spacing: 0) {
                    ForEach(0..<5) { index in
                        HStack(spacing: 0) {
                            if isCompleted {
                                Circle()
                                    .frame(width: 25, height: 25)
                                    .foregroundStyle( index == 0 ? .cutsomOrange : .white)
                                if index != 4 {
                                    Rectangle()
                                        .frame(width: 20, height: 2)
                                        .foregroundStyle( index == 0 ? .cutsomOrange : .white)
                                }
                            } else {
                                Circle()
                                    .foregroundStyle(.white)
                                    .frame(width: 25, height: 25)
                                if index != 4 {
                                    Rectangle()
                                        .foregroundStyle(.white)
                                        .frame(width: 20, height: 2)
                                }
                            }
                          
                            
                        }
                    }
                }
                .padding(.bottom)
                
                VStack {
                    if isCompleted {
                        Spacer()
                        
                        Text("""
You completed today's challenge and became stronger! Keep it up!
""")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        Text("You will receive a notification when a new challenge is available!")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .foregroundStyle(.gray)
                        Spacer()
                    } else {
                        Spacer()
                        
                        Text("Your challenge for today:")
                        
                        Spacer()
                        
                        Text("Walk 10,000 steps a day")
                            .foregroundStyle(.cutsomOrange)
                            .font(.system(size: 32))
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }
                }
                .padding(.top)
                    .foregroundStyle(.white)
                    .frame(width: size().width - 40, height: 150)
                    .padding(.vertical)
                    .background {
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.softBlue)
                            .shadow(color: .gray, radius: 10)
                            .cornerRadius(18)
                        
                    }
                
                
                Spacer()
                
                Button {
                    withAnimation {
                        isCompleted.toggle()
                        UserDefaults.standard.set(true, forKey: "challange")
                    }
                    
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: size().width - 80, height: 65)
                        .foregroundStyle(.cutsomOrange)
                        .overlay {
                            Text("Challenge completed!")
                                .foregroundStyle(.white)
                                .font(.system(size: 22, weight: .black))
                        }
                }
                .disabled(isCompleted)
                .opacity(isCompleted ? 0.5 : 1)
                
                Spacer()
            }
        }
        .onAppear {
            isCompleted = UserDefaults.standard.bool(forKey: "challange")
        }
        .fullScreenCover(isPresented: $isNotifShown) {
            NotificationsView()
        }
    }
}

#Preview {
    ChallangeView()
}
