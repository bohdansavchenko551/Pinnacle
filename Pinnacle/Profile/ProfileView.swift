//
//  ProfileView.swift
//  Pinnacle
//
//  Created by D K on 07.03.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var userImage: UIImage?
    @State private var isShown = false
    @State private var isWannaDelete = false
    
    @State private var isContactShown = false
    @State private var isPrivacyShown = false
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.darkBlue)
                .ignoresSafeArea()
            
            ScrollView {
                
                HStack {
                    Spacer()
                    
                    Text("Profile")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .black))
                    
                    Spacer()
                    
                }
                .padding(.leading)
                
                VStack(spacing: 25) {
                    if let image = userImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 150 , height: 150)
                            .overlay {
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        Button {
                                            isShown.toggle()
                                        } label: {
                                            Image(systemName: "plus.circle.dashed")
                                        }
                                        .foregroundStyle(.cutsomOrange)
                                    }
                                }
                            }
                    } else {
                        Image(systemName: "person")
                            .font(.system(size: 68))
                            .background {
                                Circle()
                                    .stroke(lineWidth: 4)
                                    .foregroundStyle(.cutsomOrange)
                                    .frame(width: 150 , height: 150)
                            }
                            .frame(width: 150 , height: 150)
                            .overlay {
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        Button {
                                            isShown.toggle()
                                        } label: {
                                            Image(systemName: "plus.circle.dashed")
                                        }
                                        .foregroundStyle(.cutsomOrange)
                                    }
                                }
                            }
                    }
                    
                    RoundedRectangle(cornerRadius: 18)
                        .foregroundStyle(.cutsomOrange)
                        .frame(width: size().width - 40, height: 100)
                        .overlay {
                            ZStack {
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(lineWidth: 2)
                                    .foregroundStyle(.white)
                                
                                VStack {
                                    Spacer()
                                    
                                    Text("User:")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 18, design: .monospaced))
                                        .frame(width: size().width - 60, alignment: .leading)
                                    
                                    Spacer()
                                    
                                    
                                    Text(authViewModel.userSession?.email ?? "Anonymous")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 24, weight: .black))
                                        .frame(width: size().width - 60, alignment: .leading)
                                    
                                    Spacer()
                                }
                            }
                        }
                    
                    RoundedRectangle(cornerRadius: 18)
                        .foregroundStyle(.cutsomOrange)
                        .frame(width: size().width - 40, height: 150)
                        .overlay {
                            ZStack {
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(lineWidth: 2)
                                    .foregroundStyle(.white)
                                
                                VStack {
                                    Spacer()
                                    
                                    Text("Support:")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 18, design: .monospaced))
                                        .frame(width: size().width - 60, alignment: .leading)
                                    
                                    
                                    Spacer()
                                    
                                    Button {
                                        isContactShown.toggle()
                                    } label: {
                                        HStack {
                                            Image("contactIcon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 20, height: 20)
                                            
                                            Text("Contact Us")
                                                .font(.system(size: 17, weight: .bold))
                                                .foregroundStyle(.white)
                                                .padding(.leading, 30)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundStyle(.white)
                                        }
                                        .padding(.horizontal)
                                    }
                                    
                                    Spacer()
                                    
                                    Button {
                                        isPrivacyShown.toggle()
                                    } label: {
                                        HStack {
                                            Image("privacyIcon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 20, height: 20)
                                            
                                            Text("Privacy Policy")
                                                .font(.system(size: 17, weight: .bold))
                                                .foregroundStyle(.white)
                                                .padding(.leading, 30)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundStyle(.white)
                                        }
                                        .padding(.horizontal)
                                    }
                                    
                                    
                                    Spacer()
                                }
                            }
                        }
                    
                    if authViewModel.currentuser?.name != "" {
                        Button {
                            isWannaDelete.toggle()
                        } label: {
                            RoundedRectangle(cornerRadius: 28)
                                .frame(width: size().width - 100, height: 70)
                                .foregroundStyle(.cutsomOrange)
                                .shadow(color: .cutsomOrange, radius: 2, y: 7)
                                .overlay {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 28)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(.white)
                                        
                                        HStack {
                                            Image("deleteIcon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 30, height: 30)
                                            
                                            Text("Delete Account")
                                                .font(.system(size: 18, weight: .bold))
                                                .foregroundStyle(.white)
                                                .padding(.leading, 30)
                                            
                                            Spacer()
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                        }
                    }
                    
                    
                    Button {
                        authViewModel.signOut()
                    } label: {
                        RoundedRectangle(cornerRadius: 28)
                            .frame(width: size().width - 190, height: 70)
                            .foregroundStyle(.cutsomOrange)
                            .shadow(color: .cutsomOrange, radius: 2, y: 7)
                            .overlay {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 28)
                                        .stroke(lineWidth: 2)
                                        .foregroundStyle(.white)
                                    HStack {
                                        Image("exitIcon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                        
                                        Text("Log Out")
                                            .font(.system(size: 18, weight: .bold))
                                            .foregroundStyle(.white)
                                            .padding(.leading, 15)
                                        
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                }
                               
                            }
                    }
                    .padding(.bottom, 150)
                    
                    
                    
                }
            }
            .scrollIndicators(.hidden)
        }
        .sheet(isPresented: $isContactShown) {
            PrivacyPolicyWrapper(privacyURL: "https://sites.google.com/view/pinnacle-sportvolunteer/contact-us")
                .presentationDetents([.height(size().height / 1.15)])
        }
        .sheet(isPresented: $isPrivacyShown) {
            PrivacyPolicyWrapper(privacyURL: "https://sites.google.com/view/pinnacle-sportvolunteer/privacy-policy")
                .presentationDetents([.height(size().height / 1.15)])
        }
        .onChange(of: userImage ?? UIImage()) { newValue in
            RealmManager.shared.saveImage(image: newValue)
            
        }
        .sheet(isPresented: $isShown, content: {
            ImagePicker(sourceType: .camera, selectedImage: $userImage)
                .ignoresSafeArea()
        })
        .onAppear {
            if let imageData = RealmManager.shared.images.first?.imageData {
                userImage = UIImage(data: imageData)
            }
        }
        .alert("Are you sure?", isPresented: $isWannaDelete) {
            Button {
                authViewModel.deleteUserAccount { result in
                    switch result {
                    case .success():
                        print("Account deleted successfully.")
                        authViewModel.userSession = nil
                        authViewModel.currentuser = nil
                    case .failure(let error):
                        print("ERROR DELELETING: \(error.localizedDescription)")
                    }
                }
            } label: {
                Text("Yes")
            }
            
            Button {
                
            } label: {
                Text("No")
            }
        } message: {
            Text("")
        }
    }
    
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}


struct ImagePicker: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType
    
    @Binding var selectedImage: UIImage?
    
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
