//
//  SmallTrainingCell.swift
//  Pinnacle
//
//  Created by D K on 10.03.2025.
//

import SwiftUI

struct SmallTrainingCell: View {
    
    var image: String
    var training: Training
    var completion: () -> ()
    
    var body: some View {
        Button {
            completion()
        } label: {
            RoundedRectangle(cornerRadius: 18)
                .foregroundStyle(.cutsomOrange.opacity(0.8))
                .frame(width: size().width - 40, height: 100)
                .overlay {
                    HStack {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .colorInvert()
                        
                        VStack(alignment: .leading) {
                            Text(training.title)
                                .foregroundStyle(.white)
                            
                            Text("\(training.date) \(training.time)")
                                .foregroundStyle(.white)
                            
                            Text(training.coachName)
                                .foregroundStyle(.white)
                        }
                        .padding(.leading)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal)
                }
        }
    }
}


#Preview {
    SportTypeView(image: "f1", trainings: DataManager.shared.football, icon: ""){}
}
