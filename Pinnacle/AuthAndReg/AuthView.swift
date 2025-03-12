//
//  AuthView.swift
//  Pinnacle
//
//  Created by D K on 07.03.2025.
//

import SwiftUI

struct AuthView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    
    @State private var mail = ""
    @State private var pass = ""
    
    @State private var isAlertShown = false
    @State private var isOnboarded = false
    
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
                        .frame(width: 250 , height: 220)
                    
                    
                    TextField("", text: $mail, prompt: Text("example@mail").foregroundColor(.gray))
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.softBlue)
                        }
                        .padding(.horizontal)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .foregroundStyle(.white)
                    
                    SecureField("", text: $pass, prompt: Text("Enter your password").foregroundColor(.gray))
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.softBlue)
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .foregroundStyle(.white)

                    
                    Spacer()
                    
                    Button {
                        Task {
                            try await viewModel.signIn(email: mail, password: pass)
                        }
                        isAlertShown.toggle()
                    } label: {
                        RoundedRectangle(cornerRadius: 18)
                            .frame(width: size().width - 80, height: 65)
                            .foregroundStyle(.cutsomOrange)
                            .overlay {
                                Text("Sign In")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 22, weight: .black))
                            }
                    }
                    
                    NavigationLink {
                        RegView(viewModel: viewModel)
                            .navigationBarBackButtonHidden()
                    } label: {
                        RoundedRectangle(cornerRadius: 18)
                            .frame(width: size().width - 80, height: 65)
                            .foregroundStyle(.cutsomOrange)
                            .overlay {
                                HStack {
                                    Text("Not Registered yet?")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20, weight: .regular))
                                    
                                    Text("Sign Up")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20, weight: .bold))
                                }
                            }
                    }
                    .padding(.vertical, 10)
                    
                    Button {
                        Task {
                            await viewModel.signInAnonymously()
                        }
                        isAlertShown.toggle()
                    } label: {
                        RoundedRectangle(cornerRadius: 18)
                            .frame(width: size().width - 80, height: 65)
                            .foregroundStyle(.cutsomOrange)
                            .overlay {
                                HStack {
                                    Text("Continue without registration")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20, weight: .regular))
                                    
                                    
                                }
                            }
                    }
                    .padding(.bottom)
                    
                }
            }
        }
        .onAppear {
            if !UserDefaults.standard.bool(forKey: "first") {
                isOnboarded = true
                UserDefaults.standard.setValue(true, forKey: "first")
            }
        }
        .fullScreenCover(isPresented: $isOnboarded) {
            OnboardingView()
        }
        .overlay {
            if isAlertShown {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.black.opacity(0.1))
                    
                    CustomAlert(text: "User not found. Check the data correctly.", seconds: 5) {
                        isAlertShown = false
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

//#Preview {
//    AuthView()
//}
