//
//  CustomAlert.swift
//  Pinnacle
//
//  Created by D K on 10.03.2025.
//

import SwiftUI

struct CustomAlert: View {
    
    var text: String
    var seconds: Int
    
    @State private var firstFlag = false
    @State private var secondFlag = true
    var completion: () -> ()
    
    var body: some View {
        ZStack {
            if firstFlag {
                Rectangle()
                    .frame(width: size().width - 40, height: 150)
                    .cornerRadius(12)
                    .foregroundColor(.darkBlue)
                    .shadow(color: .cutsomOrange, radius: 2)
                    .shadow(color: .cutsomOrange, radius: 3, y: 3)
                    .shadow(color: .cutsomOrange, radius: 6, y: 6)
                    .overlay {
                        if secondFlag {
                            ProgressView()
                                .controlSize(.large)
                                .tint(.cutsomOrange)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds)) {
                                        withAnimation {
                                            secondFlag.toggle()
                                        }
                                    }
                                }
                        } else {
                            VStack {
                                Text(text)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18, weight: .thin))
                                    .multilineTextAlignment(.center)
                                    .padding()
                                
                                Button {
                                    firstFlag.toggle()
                                    completion()
                                } label: {
                                    Text("Ok")
                                        .foregroundStyle(.orange)
                                }
                            }
                            .padding(.vertical)
                        }
                        
                    }
            }
        }
        .onAppear {
            withAnimation(.spring(duration: 2, bounce: 2)) {
                firstFlag.toggle()
            }
        }
    }
}

#Preview {
    CustomAlert(text: "Your application has been sent. \nWe are waiting for you at the training!", seconds: 2){}
        .preferredColorScheme(.dark)
}
