//
//  NewHome.swift
//  Pinnacle
//
//  Created by D K on 31.03.2025.
//

import SwiftUI
import SDWebImageSwiftUI


struct NewHome: View {
    
    @State private var isShown = false
    @State private var selectedEmote = "neutral.gif"
    @State private var isRewardsShown = false
    @State private var isTrainerShown = false
    @State private var isMotivatorShown = false
    @State private var isSportShown = false
    @State private var isSessionsShown = false
    @State private var isHomeTrainingsShown = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.darkBlue)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 60)
                    
                    Spacer()
                    
                    Text("Pinnacle")
                        .foregroundStyle(.white)
                        .font(.system(size: 26))
                        .bold()
                    
                    Spacer()
                    
                    Button {
                        isRewardsShown.toggle()
                    } label: {
                        Image("newTrophyIcon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                    }
                }
                .padding(.horizontal)
                ScrollView {
                    //motiv
                    HStack {
                        Text("Push harder today to be stronger tomorrow. \nEvery effort counts!")
                            .foregroundStyle(.white)
                            .font(.system(size: 24))
                        
                        Text("💪🏻")
                            .font(.system(size: 64))
                    }
                    .padding(.horizontal, 30)
                    
                    //mood
                    HStack {
                        Text("Mood today:")
                            .foregroundStyle(.white)
                            .font(.system(size: 30, weight: .black))
                        
                        
                        Spacer()
                        Button {
                            withAnimation {
                                isShown.toggle()
                            }
                        } label: {
                            AnimatedImage(name: selectedEmote, bundle: .main)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        }
                        .onChange(of: selectedEmote) { newValue in
                            UserDefaults.standard.setValue(newValue, forKey: "emote")
                        }
                    }
                    .padding(.horizontal, 35)
                    
                    
                    //buttons
                    
                    HStack {
                        Button {
                            isTrainerShown.toggle()
                        } label: {
                            Image("button1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: size().width / 2.2, height: size().width / 3)
                                .overlay {
                                    VStack {
                                        HStack {
                                            Text("Personal \nTrainer")
                                                .foregroundStyle(.white)
                                                .multilineTextAlignment(.leading)
                                                .bold()
                                            
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding()
                                }
                        }
                        
                        Spacer()
                        
                        Button {
                            isMotivatorShown.toggle()
                        } label: {
                            Image("button2")
                                .resizable()
                                .scaledToFill()
                                .frame(width: size().width / 2.2, height: size().width / 3)
                                .overlay {
                                    VStack {
                                        HStack {
                                            Text("Sports \nMotivator")
                                                .foregroundStyle(.white)
                                                .multilineTextAlignment(.leading)
                                                .bold()
                                            
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding()
                                }
                        }
                    }
                    .padding(.horizontal, 20)

                    HStack {
                        Button {
                            isSportShown.toggle()
                        } label: {
                            Image("button3")
                                .resizable()
                                .scaledToFill()
                                .frame(width: size().width / 2.2, height: size().width / 3)
                                .overlay {
                                    VStack {
                                        HStack {
                                            Text("Sign up for \nTraining")
                                                .foregroundStyle(.white)
                                                .multilineTextAlignment(.leading)
                                                .bold()
                                            
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding()
                                }
                        }
                        
                        Spacer()
                        
                        Button {
                            isHomeTrainingsShown.toggle()
                        } label: {
                            Image("button4")
                                .resizable()
                                .scaledToFill()
                                .frame(width: size().width / 2.2, height: size().width / 3)
                                .overlay {
                                    VStack {
                                        HStack {
                                            Text("Training \nat Home")
                                                .foregroundStyle(.white)
                                                .multilineTextAlignment(.leading)
                                                .bold()
                                            
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding()
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 5)
                    
                    Button {
                        isSessionsShown.toggle()
                    } label: {
                        Image("button5")
                            .resizable()
                            .scaledToFill()
                            .frame(width: size().width - 40, height: 145)
                            .overlay {
                                VStack {
                                    Text("Upcoming training sessions")
                                        .foregroundStyle(.white)
                                        .multilineTextAlignment(.leading)
                                        .bold()
                                    
                                    Spacer()
                                }
                                .padding()
                            }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 150)
                }
                
            }
        }
        .overlay {
            if isShown {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                        .colorMultiply(.black.opacity(0.5))
                    
                    VStack {
                        
                        Text("Select your mood for Today:")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        HStack(spacing: 20) {
                            Button {
                                selectedEmote = "engry.gif"
                                withAnimation {
                                    isShown.toggle()
                                }
                            } label: {
                                AnimatedImage(name: "engry.gif", bundle: .main)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                            
                            Button {
                                selectedEmote = "sad.gif"
                                withAnimation {
                                    isShown.toggle()
                                }
                            } label: {
                                AnimatedImage(name: "sad.gif", bundle: .main)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                            
                            Button {
                                selectedEmote = "neutral.gif"
                                withAnimation {
                                    isShown.toggle()
                                }
                            } label: {
                                AnimatedImage(name: "neutral.gif", bundle: .main)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                            
                            Button {
                                selectedEmote = "good.gif"
                                withAnimation {
                                    isShown.toggle()
                                }
                            } label: {
                                AnimatedImage(name: "good.gif", bundle: .main)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                            
                            Button {
                                selectedEmote = "love.gif"
                                withAnimation {
                                    isShown.toggle()
                                }
                            } label: {
                                AnimatedImage(name: "love.gif", bundle: .main)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                        }
                    }
                }
                .ignoresSafeArea()
                .background(.thinMaterial)
            }
        }
        .onAppear {
            selectedEmote = UserDefaults.standard.string(forKey: "emote") ?? "neutral.gif"
        }
        .fullScreenCover(isPresented: $isRewardsShown) {
            NewRewardsView()
        }
        .fullScreenCover(isPresented: $isTrainerShown) {
            PresonalTrainer()
        }
        .fullScreenCover(isPresented: $isMotivatorShown) {
            MotivatorView()
        }
        .fullScreenCover(isPresented: $isSportShown) {
            MainView(){}
        }
        .fullScreenCover(isPresented: $isSessionsShown) {
            SavedReservesView()
        }
        .fullScreenCover(isPresented: $isHomeTrainingsShown) {
            HomeSportView()
        }
    }
}

#Preview {
    NewHome()
}
