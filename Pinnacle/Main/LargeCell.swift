//
//  LargeCell.swift
//  Pinnacle
//
//  Created by D K on 07.03.2025.
//

import SwiftUI

struct LargeCell: View {
    
    var image: String
    var title: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: size().width / 2.5, height: 150)
            .cornerRadius(12)
            
            .shadow(color: .softBlue, radius: 1)
            .overlay {
                Text(title)
                    .foregroundStyle(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .shadow(radius: 3)
            }
        
    }
}

#Preview {
    MainView(){}
}

//#Preview {
//    LargeCell(image: "f2", title: "Football")
//        .preferredColorScheme(.dark)
//}
