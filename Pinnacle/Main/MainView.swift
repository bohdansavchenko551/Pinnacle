//
//  MainView.swift
//  Pinnacle
//
//  Created by D K on 07.03.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundStyle(.darkBlue)
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView {
                        VStack(spacing: 25) {
                            Image("logo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200 , height: 160)
                            
                            NavigationLink {
                                SportTypeView(image: "f1", trainings: DataManager.shared.football, icon: "football")
                                    .navigationBarBackButtonHidden()
                            } label: {
                                LargeCell(image: "f2", title: "Soccer")
                            }
                            
                            NavigationLink {
                                SportTypeView(image: "b2", trainings: DataManager.shared.basketball, icon: "basketball")
                                    .navigationBarBackButtonHidden()
                            } label: {
                                LargeCell(image: "b2", title: "Basketball")
                            }
                            
                            NavigationLink {
                                SportTypeView(image: "t2", trainings: DataManager.shared.tennis, icon: "tennis")
                                    .navigationBarBackButtonHidden()
                            } label: {
                                LargeCell(image: "t2", title: "Tennis")
                            }
                            
                            NavigationLink {
                                SportTypeView(image: "h1", trainings: DataManager.shared.hockey, icon: "hockey")
                                    .navigationBarBackButtonHidden()
                            } label: {
                                LargeCell(image: "h2", title: "Hockey")
                            }
                            
                            NavigationLink {
                                SportTypeView(image: "v1", trainings: DataManager.shared.volleyball, icon: "volleyball")
                                    .navigationBarBackButtonHidden()
                            } label: {
                                LargeCell(image: "v2", title: "Volleyball")
                            }
                                .padding(.bottom, 150)
                        }
                        .padding(.top)
                        .frame(width: size().width)
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
