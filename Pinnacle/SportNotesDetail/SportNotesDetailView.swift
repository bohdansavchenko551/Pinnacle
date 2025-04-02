//
//  SportNotesDetailView.swift
//  Pinnacle
//
//  Created by D K on 01.04.2025.
//

import SwiftUI

struct SportNotesDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    var note: RealmNote
    
    @State private var isEditing = false
    @State private var noteTitle = ""
    @State private var noteText = ""
    
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
                        ZStack {
                            Image("tabIcon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                            
                            Image(systemName: "xmark")
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.bottom, 6)
                        }
                    }
                    .padding(.top, 5)
                    
                    Spacer()
                    
                    Text("Notes Details")
                        .foregroundStyle(.white)
                        .font(.system(size: 28, weight: .black))
                    
                    Spacer()
                    
                    Button {
                        RealmManager.shared.deleteNote(note: note)
                        dismiss()
                    } label: {
                        ZStack {
                            Image("tabIcon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                            
                            Image(systemName: "trash")
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.bottom, 6)
                        }
                    }
                    .padding(.top, 5)
                    
                }
                .padding(.horizontal)
                
                if !isEditing {
                    VStack {
                        HStack {
                            Text(noteTitle)
                                .foregroundStyle(.white)
                                .font(.system(size: 32, weight: .black))
                            
                            Spacer()
                            
                            Button {
                                withAnimation {
                                    isEditing.toggle()
                                }
                            } label: {
                                ZStack {
                                    Image("tabIcon")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                    
                                    Image(systemName: "pencil")
                                        .foregroundStyle(.white)
                                        .bold()
                                        .padding(.bottom, 6)
                                }
                            }
                            .padding(.top, 5)
                        }
                        .padding(.horizontal)
                        
                        UnevenRoundedRectangle(topLeadingRadius: 24, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 24)
                            .foregroundStyle(.semiBlue)
                            .overlay {
                                ScrollView {
                                    Text(noteText)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20))
                                }
                                .padding()
                            }
                    }
                } else {
                    VStack {
                        HStack {
                            TextField("Title", text: $noteTitle)
                                .foregroundStyle(.white)
                                .font(.system(size: 32, weight: .black))
                                .padding(10)
                                .background {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(.gray.opacity(0.3))
                                        
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(.white)
                                    }
                                }
                            
                            Spacer()
                            
                            Button {
                                withAnimation {
                                    isEditing.toggle()
                                }
                                RealmManager.shared.updateNote(realmNote: note, newTitle: noteTitle, newNote: noteText)
                            } label: {
                                ZStack {
                                    Image("tabIcon")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                    
                                    Image(systemName: "square.and.arrow.down")
                                        .foregroundStyle(.white)
                                        .bold()
                                        .padding(.bottom, 6)
                                }
                            }
                            .padding(.top, 5)
                        }
                        .padding(.horizontal)
                        
                        TextEditor(text: $noteText)
                            .padding()
                            .frame(height: size().height / 1.5)
                            .background {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundStyle(.gray.opacity(0.3))
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(lineWidth: 2)
                                        .foregroundStyle(.white)
                                    if noteText.isEmpty {
                                        VStack {
                                            HStack {
                                                Text("Type here...")
                                                    .foregroundStyle(.gray)
                                                    .padding(.top, 25)
                                                    .padding(.leading, 22)
                                                
                                                Spacer()
                                            }
                                            
                                            Spacer()
                                        }
                                    }
                                }
                            }
                            .tint(.white)
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                            .scrollContentBackground(.hidden)
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            noteTitle = note.title
            noteText = note.note
        }
    }
}

#Preview {
    SportNotesDetailView(note: RealmManager.shared.noteMOCK())
}
