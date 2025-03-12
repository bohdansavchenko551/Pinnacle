//
//  NotificationsView.swift
//  Pinnacle
//
//  Created by D K on 10.03.2025.
//

import SwiftUI

struct NotificationsView: View {
    
    @Environment(\.dismiss) var dismiss
    
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
                            .font(.system(size: 24, weight: .bold))
                    }
                    .padding(.leading)
                    
                    Spacer()
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                
                Text("There are no notifications")
                    .foregroundStyle(.gray)
                    .font(.system(size: 32, weight: .ultraLight))
                    .padding()
                    .multilineTextAlignment(.center)
                
                Image(systemName: "bell")
                    .foregroundStyle(.gray)
                    .font(.system(size: 92, weight: .ultraLight))
                
                Spacer()
            }
        }
    }
}

#Preview {
    NotificationsView()
}
