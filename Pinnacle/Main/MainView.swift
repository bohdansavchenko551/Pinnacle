//
//  MainView.swift
//  Pinnacle
//
//  Created by D K on 07.03.2025.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.dismiss) var dismiss
    var completion: () -> ()
    
    var body: some View {
        NavigationStack {
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
                        
                        Text("Sport Volunteer")
                            .foregroundStyle(.white)
                            .font(.system(size: 32, weight: .black))
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    
                    Text("Choose your activity:")
                        .foregroundStyle(.white)
                        .font(.system(size: 18, weight: .semibold, design: .monospaced))
                        .frame(width: size().width - 60, alignment: .leading)
                        .padding(.vertical)
                    
                    ScrollView {
                        VStack(spacing: 25) {
                            HStack(spacing: 20) {
                                NavigationLink {
                                    SportTypeView(image: "f1", trainings: DataManager.shared.football, icon: "Soccer") {
                                        completion()
                                    }
                                    .onAppear {
                                        completion()
                                    }
                                    .navigationBarBackButtonHidden()
                                } label: {
                                    LargeCell(image: "f2", title: "Soccer")
                                }
                                
                                NavigationLink {
                                    SportTypeView(image: "b1", trainings: DataManager.shared.basketball, icon: "basketball") {
                                        completion()
                                    }
                                    .onAppear {
                                        completion()
                                    }
                                    .navigationBarBackButtonHidden()
                                } label: {
                                    LargeCell(image: "b2", title: "Basketball")
                                }
                            }
                            
                            HStack(spacing: 20) {
                                NavigationLink {
                                    SportTypeView(image: "t1", trainings: DataManager.shared.tennis, icon: "tennis") {
                                        completion()
                                    }
                                    .onAppear {
                                        completion()
                                    }
                                    .navigationBarBackButtonHidden()
                                } label: {
                                    LargeCell(image: "t2", title: "Tennis")
                                }
                                
                                NavigationLink {
                                    SportTypeView(image: "h1", trainings: DataManager.shared.hockey, icon: "hockey") {
                                        completion()
                                    }
                                    .onAppear {
                                        completion()
                                    }
                                    .navigationBarBackButtonHidden()
                                } label: {
                                    LargeCell(image: "h2", title: "Hockey")
                                }
                            }
                            
                            HStack {
                                NavigationLink {
                                    SportTypeView(image: "v1", trainings: DataManager.shared.volleyball, icon: "volleyball") {
                                        completion()
                                    }
                                    .onAppear {
                                        completion()
                                    }
                                    .navigationBarBackButtonHidden()
                                } label: {
                                    LargeCell(image: "v2", title: "Volleyball")
                                }
                                
                                VStack {
                                    
                                }
                                .frame(width: size().width / 2.5, height: 150)
                            }
                            .padding(.bottom, 150)
                        }
                        .padding(.top)
                        .frame(width: size().width - 50)
                    }
                    .ignoresSafeArea(.all)
                    .padding(.bottom, 50)
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
}

#Preview {
    MainView(){}
}
