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
                VStack(spacing: 25) {
                    if let image = userImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 200 , height: 160)
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
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200 , height: 160)
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
                    
                    
                    Text(authViewModel.currentuser?.name ?? "")
                        .foregroundStyle(.white)
                        .frame(width: size().width - 40, alignment: .leading)
                    
                    Text(authViewModel.userSession?.email ?? "Anonymous")
                        .foregroundStyle(.white)
                        .frame(width: size().width - 40, alignment: .leading)                    
                    
                    Button {
                        isContactShown.toggle()
                    } label: {
                        RoundedRectangle(cornerRadius: 18)
                            .frame(width: size().width - 100, height: 70)
                            .foregroundStyle(.cutsomOrange)
                            .overlay {
                                HStack {
                                    Image("contactIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                    
                                    Text("Contact Us")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(.white)
                                        .padding(.leading, 30)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                    }
                    
                    
                    
                    Button {
                        isPrivacyShown.toggle()
                    } label: {
                        RoundedRectangle(cornerRadius: 18)
                            .frame(width: size().width - 100, height: 70)
                            .foregroundStyle(.cutsomOrange)
                            .overlay {
                                HStack {
                                    Image("privacyIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                    
                                    Text("Privacy Policy")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(.white)
                                        .padding(.leading, 30)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                    }
                    
                    
                    Button {
                        authViewModel.signOut()
                    } label: {
                        RoundedRectangle(cornerRadius: 18)
                            .frame(width: size().width - 100, height: 70)
                            .foregroundStyle(.cutsomOrange)
                            .overlay {
                                HStack {
                                    Image("exitIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                    
                                    Text("Log Out")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(.white)
                                        .padding(.leading, 30)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                    }
                    
                    
                    if authViewModel.currentuser?.name != "" {
                        Button {
                            isWannaDelete.toggle()
                        } label: {
                            RoundedRectangle(cornerRadius: 18)
                                .frame(width: size().width - 100, height: 70)
                                .foregroundStyle(.cutsomOrange)
                                .overlay {
                                    HStack {
                                        Image("deleteIcon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                                        
                                        Text("Delete Account")
                                            .font(.system(size: 24, weight: .bold))
                                            .foregroundStyle(.white)
                                            .padding(.leading, 30)
                                        
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                }
                        }
                        .padding(.bottom, 150)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .sheet(isPresented: $isContactShown) {
            PrivacyPolicyWrapper(privacyURL: "https://sites.google.com/view/betwayrules/contact-us")
                .presentationDetents([.height(size().height / 1.15)])
        }
        .sheet(isPresented: $isPrivacyShown) {
            PrivacyPolicyWrapper(privacyURL: "https://sites.google.com/view/betwayrules/privacy-policy")
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

//#Preview {
//    ProfileView()
//}


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
