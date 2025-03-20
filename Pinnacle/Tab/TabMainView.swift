//
//  TabsView.swift
//  Pinnacle
//
//  Created by D K on 20.03.2025.
//

import SwiftUI

#Preview {
    TabMainView()
}

struct TabMainView: View {
    
    
    @EnvironmentObject var authViewModel: AuthViewModel
    init() {
           UITabBar.appearance().isHidden = true
       }
    
    @State private var isTabBarShown = true
    @State private var actibeTab: Tab = .home
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $actibeTab) {
                    MainView() {
                        isTabBarShown.toggle()
                    }
                        .navigationBarHidden(true)
                        .toolbar(.hidden, for: .tabBar)
                        .tag(Tab.home)
                    
                    NewsView()
                    .navigationBarHidden(true)
                    .toolbar(.hidden, for: .tabBar)
                    .tag(Tab.stat)
                    
                    ChallangeView()
                        .navigationBarHidden(true)
                        .toolbar(.hidden, for: .tabBar)
                        .tag(Tab.challange)
                    
                    SavedReservesView()
                    .navigationBarHidden(true)
                    .toolbar(.hidden, for: .tabBar)
                    .tag(Tab.percent)
                    
                    ProfileView()
                    .navigationBarHidden(true)
                    .toolbar(.hidden, for: .tabBar)
                    .tag(Tab.settings)
                    .environmentObject(authViewModel)

                }
                
                
            }
            .overlay {
                if isTabBarShown {
                    VStack {
                        Spacer()
                        
                        
                        TabBarView(tab: $actibeTab)
                            .toolbar(.hidden, for: .tabBar)
                            .padding(.horizontal)
                            .ignoresSafeArea()
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}


struct TabBarView: View {
    
    @Binding var tab: Tab
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.darkBlue)
                .shadow(color: .softBlue.opacity(0.4), radius: 20, x: 0, y: 20)
            
            TabsLayoutView(selectedTab: $tab)
                .toolbar(.hidden, for: .tabBar)
                .navigationBarHidden(true)
        }
        .frame(height: 70, alignment: .center)
        .padding(.bottom, 10)
    }
}

fileprivate struct TabsLayoutView: View {
    @Binding var selectedTab: Tab
    @Namespace var namespace
    
    var body: some View {
        HStack {
            Spacer(minLength: 0)
            
            ForEach(Tab.allCases) { tab in
                TabButton(tab: tab, selectedTab: $selectedTab, namespace: namespace)
                    .toolbar(.hidden, for: .tabBar)
                    .frame(width: 65, height: 65, alignment: .center)
                    .toolbar(.hidden, for: .tabBar)
                    .navigationBarHidden(true)
                Spacer(minLength: 0)
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarHidden(true)
    }
    
    
    
    private struct TabButton: View {
        let tab: Tab
        @Binding var selectedTab: Tab
        var namespace: Namespace.ID
        
        var body: some View {
            Button {
                withAnimation {
                    selectedTab = tab
                }
            } label: {
                ZStack {
                    if isSelected {
                        Circle()
                            .foregroundColor(.darkBlue)
                            .shadow(radius: 10)
                            .background {
                                Circle()
                                    .stroke(lineWidth: 15)
                                    .foregroundColor(.cutsomOrange.opacity(0.7))
                                
                            }
                            .offset(y: -25)
                            .matchedGeometryEffect(id: "Selected Tab", in: namespace)
                            .animation(.spring(), value: selectedTab)
                    }
                    
                    Image(tab.icon)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .colorInvert()
                        .colorMultiply(.white)
                        .font(.system(size: 23, weight: .semibold, design: .rounded))
                        .foregroundColor(isSelected ? .init(white: 0.9) : .gray)
                        .scaleEffect(isSelected ? 1 : 0.8)
                        .offset(y: isSelected ? -25 : 0)
                        .animation(isSelected ? .spring(response: 0.5, dampingFraction: 0.3, blendDuration: 1) : .spring(), value: selectedTab)
                }
            }
            .buttonStyle(.plain)
        }
        
        private var isSelected: Bool {
            selectedTab == tab
        }
    }
}


enum Tab: Int, Identifiable, CaseIterable, Comparable {
    static func < (lhs: Tab, rhs: Tab) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case home, stat, challange, percent, settings
    
    internal var id: Int { rawValue }
    
    var icon: String {
        switch self {
        case .home:
            return "homeIcon"
        case .stat:
            return "news"
            
        case .challange:
            return "challange"
            
        case .percent:
            return "reserIcon"
        case .settings:
            return "profileIcon"
        }
    }
}
