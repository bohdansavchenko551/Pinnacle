//
//  OnboardingView.swift
//  Pinnacle
//
//  Created by D K on 11.03.2025.
//

import SwiftUI

class Onboarding: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var buttonText: String
    
    init(title: String, text: String, buttonText: String) {
        self.title = title
        self.text = text
        self.buttonText = buttonText
    }
}

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var currentNewsIndex: Int = 0
    
    
    let onboardingText: [Onboarding] = [
        Onboarding(title: "Welcome to Pinnacle!", text: "Discover free training sessions in soccer, basketball, tennis, hockey, and volleyball. Train with passionate volunteer coaches and take your skills to the next level!", buttonText: "Next"),
        Onboarding(title: "Choose Your Sport", text: "Browse available training sessions across different sports. Find what excites you and join a community of athletes and volunteers!", buttonText: "Next"),
        Onboarding(title: "Join a Session Effortlessly", text: "Sign up for any session with just a tap. View all your upcoming trainings in one place and never miss a chance to improve!", buttonText: "Next"),
        Onboarding(title: "Stay Informed", text: "Get the latest sports updates, expert tips, and tricks to boost your performance. Stay ahead of the game!", buttonText: "Next"),
        Onboarding(title: "Ready to Train?", text: "Sign up now and start your journey with Pinnacle. The best training experience is just a tap away!", buttonText: "Start Now")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundStyle(.darkBlue)
                    .ignoresSafeArea()
                
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250 , height: 200)
                        .shadow(color: .softBlue, radius: 10)
                        .mask(LinearGradient(gradient: Gradient(stops: [
                            .init(color: .black, location: 0),
                            .init(color: .clear, location: 1),
                            .init(color: .black, location: 1),
                            .init(color: .clear, location: 1)
                        ]), startPoint: .top, endPoint: .bottom))
                    
                    GeometryReader { geometry in
                        TabView(selection: $currentNewsIndex) {
                            ForEach(0..<onboardingText.count, id: \.self) { index in
                                VStack {
                                    Text(onboardingText[index].title)
                                        .foregroundStyle(.white)
                                        .font(.system(size: 32, weight: .thin))
                                        .padding(.horizontal)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                    Text(onboardingText[index].text)
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20, weight: .thin))
                                        .padding(.horizontal)
                                    Spacer()
                                    Button {
                                        if currentNewsIndex < onboardingText.count - 1 {
                                            withAnimation {
                                                currentNewsIndex += 1
                                            }
                                        } else {
                                            dismiss()
                                        }
                                        
                                    } label: {
                                        RoundedRectangle(cornerRadius: 18)
                                            .frame(width: size().width - 160, height: 65)
                                            .foregroundStyle(.cutsomOrange)
                                            .overlay {
                                                Text(onboardingText[index].buttonText)
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 22, weight: .black))
                                            }
                                    }
                                    Spacer()
                                }
                            }
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
