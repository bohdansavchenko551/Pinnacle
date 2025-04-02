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
    
    @FocusState private var isEmailFieldFocused: Bool
    @FocusState private var isPassFieldFocused: Bool
    
    @State private var isShown = false
    
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
                        .frame(width: 170 , height: 160)
                    
                    UnevenRoundedRectangle(topLeadingRadius: 24, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 24)
                        .foregroundStyle(.darkBlue)
                        .overlay {
                            UnevenRoundedRectangle(topLeadingRadius: 24, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 24)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.white)
                        }
                        .overlay {
                            VStack {
                                
                                Text("Login")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 32, weight: .bold))
                                    .padding(.top)
                                
                                Text("Welcome! Please enter your details.")
                                    .foregroundStyle(.white)
                                    .padding(.bottom)
                                    .padding(.top, 1)
                                
                                Spacer()
                                
                                TextField("", text: $mail, prompt: Text("example@mail").foregroundColor(.gray))
                                    .padding()
                                    .background {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 12)
                                                .foregroundStyle(.gray.opacity(0.3))
                                            
                                            //border line
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(lineWidth: 2)
                                                .foregroundStyle(isEmailFieldFocused ? .cutsomOrange : .white)
                                        }
                                        
                                    }
                                    .padding(.horizontal)
                                    .autocorrectionDisabled()
                                    .textInputAutocapitalization(.never)
                                    .foregroundStyle(.white)
                                    .focused($isEmailFieldFocused)
                                    
                                
                                ZStack {
                                    if !isShown {
                                        SecureField("", text: $pass, prompt: Text("Enter your password").foregroundColor(.gray))
                                    } else {
                                        TextField("", text: $pass, prompt: Text("Enter your password").foregroundColor(.gray))
                                    }
                                    
                                }
                                    .padding()
                                    .background {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 12)
                                                .foregroundStyle(.gray.opacity(0.3))
                                            
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(lineWidth: 2)
                                                .foregroundStyle(isPassFieldFocused ? .cutsomOrange : .white)
                                        }
                                        
                                    }
                                    .autocorrectionDisabled()
                                    .textInputAutocapitalization(.never)
                                    .foregroundStyle(.white)
                                    .focused($isPassFieldFocused)
                                    .overlay {
                                        HStack {
                                            Spacer()
                                            
                                            Button {
                                                isShown.toggle()
                                            } label: {
                                                Image(systemName: isShown ? "eye.fill" :"eye")
                                            }
                                            .padding(.trailing)
                                            .foregroundStyle(.white)
                                        }
                                    }
                                    .padding(.horizontal)
                                    .padding(.top)
                                
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
                                
                                Spacer()
                                
                                NavigationLink {
                                    RegView(viewModel: viewModel)
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    HStack {
                                        Text("Not Registered yet?")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .regular))
                                        
                                        Text("Sign Up")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                }
                                .padding(.vertical, 10)
                                
                                Spacer()
                                
                                Button {
                                    Task {
                                        await viewModel.signInAnonymously()
                                    }
                                    isAlertShown.toggle()
                                } label: {
                                    Text("Anonymous Login")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20, weight: .regular))
                                }
                                .padding(.bottom)
                            }
                        }
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

#Preview {
    AuthView(viewModel: AuthViewModel())
}
