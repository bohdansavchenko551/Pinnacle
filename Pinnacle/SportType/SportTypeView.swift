//
//  SportTypeView.swift
//  Pinnacle
//
//  Created by D K on 07.03.2025.
//

import SwiftUI

struct SportTypeView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var image: String
    var trainings: [Training]
    var icon: String
    var completion: () -> ()
    @State private var trainingToShow: Training?
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.darkBlue)
                .ignoresSafeArea()
            
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size().width, height: 250)
                    .clipShape(.rect(topLeadingRadius: 0, bottomLeadingRadius: 12, bottomTrailingRadius: 12, topTrailingRadius: 0))
                    .ignoresSafeArea()
                    .shadow(color: .softBlue, radius: 10, y: 10)
                    .overlay {
                        VStack {
                            HStack {
                                Button {
                                    dismiss()
                                    completion()
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
                    }
                    
                
                ScrollView {
                    ForEach(trainings, id: \.id) { tr in
                        SmallTrainingCell(image: icon, training: tr) {
                            trainingToShow = tr
                        }
                        .padding(.bottom, 10)
                    }
                    .padding(.bottom, 150)
                }
                .scrollIndicators(.hidden)
            }
        }
        .fullScreenCover(item: $trainingToShow) { tr in
            TrainingReservationView(image: image, trainig: tr, type: image)
        }
    }
}

#Preview {
    SportTypeView(image: "f1", trainings: DataManager.shared.football, icon: "football"){}
}
