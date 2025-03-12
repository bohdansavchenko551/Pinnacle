//
//  NewsDetailView.swift
//  Pinnacle
//
//  Created by D K on 11.03.2025.
//

import SwiftUI

struct NewsDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    var news: NewsElement
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.darkBlue)
                .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    Image(news.newsImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: size().width, height: 240)
                        .shadow(color: .softBlue, radius: 10)
                        .mask(LinearGradient(gradient: Gradient(stops: [
                            .init(color: .black, location: 0),
                            .init(color: .clear, location: 1),
                            .init(color: .black, location: 1),
                            .init(color: .clear, location: 1)
                        ]), startPoint: .top, endPoint: .bottom))
                        
                    Text(news.newsTitle)
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .thin))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Text(news.newsDescription)
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .thin))
                        .padding()
                        .padding(.bottom, 150)
                }
                .ignoresSafeArea()
                Spacer()
            }
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .thin))
                    }
                    .padding(.leading)
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    NewsDetailView(news: NewsElement(newsTitle: "Develop a Consistent Shooting Form", newsDescription: """
Shooting consistency in basketball is crucial for scoring efficiency. Focus on having a stable stance, aligning your shooting hand with the basket, and following through on every shot. Use repetition to engrain muscle memory—practice mid-range shots, three-pointers, and free throws with a consistent rhythm. Visualization techniques can also help improve accuracy by mentally reinforcing successful shots.
""", newsImage: "tip4"))
}
