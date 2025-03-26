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
                .foregroundStyle(.darkBlue.opacity(0.8))
                .frame(width: size().width - 40, height: 160)
                .overlay {
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(.cutsomOrange)
                }
                .overlay {
                    HStack {
                        Image(training.icon ?? "football")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Title:")
                                .foregroundStyle(.gray)
                                .font(.system(size: 11, weight: .thin, design: .monospaced))
                            
                            Text(training.title)
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.leading)
                            
                            Text("Date and Time:")
                                .foregroundStyle(.gray)
                                .font(.system(size: 11, weight: .thin, design: .monospaced))
                            
                            Text("\(convertDateFormat(inputDate: training.date)), \(training.time)")
                                .foregroundStyle(.white)
                            
                            Text("Coach:")
                                .foregroundStyle(.gray)
                                .font(.system(size: 11, weight: .thin, design: .monospaced))
                            
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
    
    
    func convertDateFormat(inputDate: String) -> String {

         let olDateFormatter = DateFormatter()
         olDateFormatter.dateFormat = "yyyy-MM-dd"

         let oldDate = olDateFormatter.date(from: inputDate)

         let convertDateFormatter = DateFormatter()
         convertDateFormatter.dateFormat = "MMM dd"

         return convertDateFormatter.string(from: oldDate!)
    }
}


#Preview {
    SportTypeView(image: "f1", trainings: DataManager.shared.football, icon: "football"){}
}
