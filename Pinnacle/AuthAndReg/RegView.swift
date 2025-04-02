//
//  RegView.swift
//  Pinnacle
//
//  Created by D K on 07.03.2025.
//

import SwiftUI

extension View {
    func size() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }
}

extension RegView: AuthViewModelProtocol {
    var isValid: Bool {
        return !mail.isEmpty
        && mail.contains("@")
        && !name.isEmpty
        && !pass.isEmpty
        && pass.count > 5
        && passAgain == pass
    }
}

struct RegView: View {
    
    @Environment(\.dismiss) var dismiss

    @ObservedObject var viewModel: AuthViewModel
    
    @State private var mail = ""
    @State private var name = ""
    @State private var pass = ""
    @State private var passAgain = ""
    
    @State private var isAlertShown = false
    
    @FocusState private var isNameFieldFocused: Bool
    @FocusState private var isEmailFieldFocused: Bool
    @FocusState private var isFPassFieldFocused: Bool
    @FocusState private var isSPassFieldFocused: Bool


    
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
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                            .font(.system(size: 28, weight: .bold))
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                }
                
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140 , height: 80)
                    .offset(y: -20)
                
                UnevenRoundedRectangle(topLeadingRadius: 24, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 24)
                    .foregroundStyle(.darkBlue)
                    .overlay {
                        UnevenRoundedRectangle(topLeadingRadius: 24, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 24)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.white)
                    }
                    .overlay {
                        VStack {
                            
                            Text("Sign Up")
                                .foregroundStyle(.white)
                                .font(.system(size: 32, weight: .bold))
                                .padding(.top)
                            
                            Text("Hello there! Let’s create your account.")
                                .foregroundStyle(.white)
                                .padding(.bottom)
                                .padding(.top, 1)
                            
                            TextField("", text: $name, prompt: Text("Enter Your Name").foregroundColor(.gray))
                                .padding()
                                .background {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundStyle(.gray.opacity(0.3))
                                        
                                        //border line
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(isNameFieldFocused ? .cutsomOrange : .white)
                                    }
                                    
                                }
                                .padding(.horizontal)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                                .padding(.top, 0)
                                .foregroundStyle(.white)
                                .focused($isNameFieldFocused)
                            
                            TextField("", text: $mail, prompt: Text("Enter your Email").foregroundColor(.gray))
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
                                .padding(.top)
                                .foregroundStyle(.white)
                                .focused($isEmailFieldFocused)

                            
                            TextField("", text: $pass, prompt: Text("Enter your password").foregroundColor(.gray))
                                .padding()
                                .background {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundStyle(.gray.opacity(0.3))
                                        
                                        //border line
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(isFPassFieldFocused ? .cutsomOrange : .white)
                                    }
                                    
                                }
                                .padding(.horizontal)
                                .padding(.top)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                                .foregroundStyle(.white)
                                .focused($isFPassFieldFocused)

                            
                            TextField("", text: $passAgain, prompt: Text("Confirm your password").foregroundColor(.gray))
                                .padding()
                                .background {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundStyle(.gray.opacity(0.3))
                                        
                                        //border line
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(isSPassFieldFocused ? .cutsomOrange : .white)
                                    }
                                    
                                }
                                .padding(.horizontal)
                                .padding(.top)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                                .foregroundStyle(.white)
                                .focused($isSPassFieldFocused)

                            
                            
                            Spacer()
                            
                            Button {
                                Task {
                                    try await viewModel.createUser(withEmail: mail, password: pass, name: name)
                                }
                                isAlertShown.toggle()
                            } label: {
                                RoundedRectangle(cornerRadius: 18)
                                    .frame(width: size().width - 80, height: 65)
                                    .foregroundStyle(.cutsomOrange)
                                    .overlay {
                                        HStack {
                                            Text("Sign Up")
                                                .foregroundStyle(.white)
                                                .font(.system(size: 20, weight: .regular))
                                            
                                            
                                        }
                                    }
                            }
                            .opacity(isValid ? 1 : 0.5)
                            .disabled(!isValid)
                            
                            Spacer()
                        }
                    }
                
                
               

                
               

                
               

                
              

                
              
                
            }
        }
        .overlay {
            if isAlertShown {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.black.opacity(0.1))
                    
                    CustomAlert(text: "An error occurred, please try again.", seconds: 5) {
                        isAlertShown = false
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    RegView(viewModel: AuthViewModel())
}
