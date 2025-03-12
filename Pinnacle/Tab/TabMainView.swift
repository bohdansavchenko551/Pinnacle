//
//  TabMainView.swift
//  Pinnacle
//
//  Created by D K on 07.03.2025.
//

import SwiftUI

struct TabMainView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var selectedTab = "Main"
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                TabView(selection: $selectedTab) {
                    MainView().tag("Main")
                    
                    NewsView().tag("News")
                    
                    SavedReservesView().tag("Reservations")
                    
                    ProfileView().tag("Profile")
                        .environmentObject(authViewModel)
                }
                
                HStack(spacing: 0) {
                    Spacer(minLength: 0)
                    
                    TabButton(title: "Main", image: "homeIcon", selected: $selectedTab)
                    
                    Spacer(minLength: 0)
                    
                    TabButton(title: "News", image: "news", selected: $selectedTab)
                    
                    Spacer(minLength: 0)
                    
                    TabButton(title: "Reservations", image: "reserIcon", selected: $selectedTab)
                    
                    Spacer(minLength: 0)
                    
                    TabButton(title: "Profile", image: "profileIcon", selected: $selectedTab)
                    
                    Spacer(minLength: 0)
                }
                .padding(.vertical, 10)
                .background {
                    Rectangle()
                        .foregroundStyle(.cutsomOrange)
                       
                }
            }
        }
    }
}

//#Preview {
//    TabMainView()
//}

struct TabButton: View {
    var title: String
    var image: String
    
    @Binding var selected: String
    
    var body: some View {
        Button {
            withAnimation(.smooth) {
                selected = title
            }
        } label: {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 35, height: 35)
                .colorInvert()
                .colorMultiply(selected == title ? .white : .black)
                .padding(.vertical, 7)
                .padding(.horizontal)
                .overlay {
                    VStack {
                        Spacer()
                        
                        if selected == title {
                            Circle()
                                .frame(width: 8)
                                .foregroundColor(.white)
                                .offset(y: 4)
                        }
                    }
                }
        }
    }
}
