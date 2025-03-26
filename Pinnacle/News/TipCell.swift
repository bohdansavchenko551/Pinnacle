//
//  TipCell.swift
//  Pinnacle
//
//  Created by D K on 26.03.2025.
//

import SwiftUI

struct TipCell: View {
    var news: NewsElement
    var completion: () -> ()
    
    var body: some View {
        Button {
            completion()
        } label: {
            Image(news.newsImage)
                .resizable()
                .scaledToFill()
                .frame(width: size().width - 90, height: 290)
                .cornerRadius(14)
                .padding()
                .shadow(color: .softBlue, radius: 10)
                .mask(LinearGradient(gradient: Gradient(stops: [
                            .init(color: .black, location: 0),
                            .init(color: .clear, location: 1),
                            .init(color: .black, location: 1),
                            .init(color: .clear, location: 1)
                        ]), startPoint: .top, endPoint: .bottom))
                .overlay {
                    VStack {
                        
                        Text(news.newsTitle)
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .semibold))
                            .padding(30)
                            .multilineTextAlignment(.center)
                    }
                }
               
        }
    }
}

//#Preview {
//    TipCell()
//}
