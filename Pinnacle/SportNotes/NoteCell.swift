//
//  NoteCell.swift
//  Pinnacle
//
//  Created by D K on 01.04.2025.
//

import SwiftUI

struct NoteCell: View {
    
    var note: RealmNote
    
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .frame(width: size().width - 30, height: 100)
            .foregroundStyle(.semiBlue)
            .overlay {
                RoundedRectangle(cornerRadius: 24)
                    .stroke(lineWidth: 4)
                    .foregroundStyle(.white)
            }
            .overlay {
                HStack {
                    Text(note.title)
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .black))
                    
                    Spacer()
                    
                    ZStack {
                        Image("tabIcon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20))
                            .foregroundStyle(.white)
                            .bold()
                            .padding(.bottom, 9)
                    }
                    .padding(.top, 5)
                }
                .padding(.horizontal)
            }
    }
}

#Preview {
    NoteCell(note: RealmManager.shared.noteMOCK())
}
