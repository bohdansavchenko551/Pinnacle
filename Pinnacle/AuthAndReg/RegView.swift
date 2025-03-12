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
                
                
                
                TextField("", text: $name, prompt: Text("Enter Your Name").foregroundColor(.gray))
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.softBlue)
                    }
                    .padding(.horizontal)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding(.top, 50)
                    .foregroundStyle(.white)

                
                TextField("", text: $mail, prompt: Text("Enter your Email").foregroundColor(.gray))
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.softBlue)
                    }
                    .padding(.horizontal)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding(.top)
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

                
                SecureField("", text: $passAgain, prompt: Text("Confirm your password").foregroundColor(.gray))
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
                .padding(.bottom, 50)
                
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
//
//#Preview {
//    RegView()
//}
