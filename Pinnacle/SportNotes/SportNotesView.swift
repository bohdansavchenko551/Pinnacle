//
//  SportNotesView.swift
//  Pinnacle
//
//  Created by D K on 01.04.2025.
//

import SwiftUI

struct SportNotesView: View {
    
    @State private var isNewNoteShown = false
    @State private var titleText = ""
    @State private var noteText = ""
    @State private var notes: [RealmNote] = []
    @StateObject private var vm = TabViewModel()
    
    var body: some View {
            ZStack {
                Rectangle()
                    .foregroundStyle(.darkBlue)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        
                        
                        Spacer()
                        
                        Text("Sport Notes")
                            .foregroundStyle(.white)
                            .font(.system(size: 26))
                            .bold()
                        
                        Spacer()
                        
                        
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        if notes.isEmpty{
                            Image(systemName: "note.text")
                                .foregroundStyle(.gray.opacity(0.5))
                                .font(.system(size: 92))
                                .padding(.top, 50)
                            
                            Text("Here you can leave your sports notes, as well as save them from your personal trainer.")
                                .foregroundStyle(.gray.opacity(0.5))
                                .font(.system(size: 32))
                                .padding(.horizontal)
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                        } else {
                            VStack(spacing: 20) {
                                ForEach(notes, id: \.id) { note in
                                    NavigationLink {
                                        SportNotesDetailView(note: note)
                                            .navigationBarBackButtonHidden()
                                            .onDisappear {
                                                notes = []
                                                notes = Array(RealmManager.shared.notes)
                                            }
                                    } label: {
                                        NoteCell(note: note)
                                    }
                                }
                            }
                            .padding(.bottom, 200)
                        }
                        
                    }
                    .scrollIndicators(.hidden)
                }
            }
        
        .overlay {
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isNewNoteShown.toggle()
                        }
                        vm.isShown.toggle()
                    } label: {
                        ZStack {
                            Image("tabIcon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                            
                            Image(systemName: "plus")
                                .font(.system(size: 28))
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.bottom, 9)
                        }
                    }
                    .padding(.top, 5)
                }
                
            }
            .padding(.bottom, 70)
            .padding(.trailing)
        }
        .fullScreenCover(isPresented: $isNewNoteShown) {
            ZStack {
                Rectangle()
                    .foregroundStyle(.white)
                    .colorMultiply(.black.opacity(0.5))
                
                VStack {
                    HStack {
                        Button {
                            withAnimation {
                                isNewNoteShown.toggle()
                                
                            }
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
                        
                        Text("Create New Note")
                            .foregroundStyle(.white)
                            .font(.system(size: 32, weight: .black))
                        // .padding(.trailing)
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, size().height > 667 ? 50 : 10)
                    
                    TextField("Sport Note Title", text: $titleText)
                        .padding()
                        .background {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(.gray.opacity(0.3))
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 2)
                                    .foregroundStyle(.white)
                            }
                        }
                        .tint(.white)
                        .foregroundStyle(.white)
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
                    
                    
                    Spacer()
                    
                    Button {
                        if !titleText.isEmpty && !noteText.isEmpty {
                            RealmManager.shared.saveNote(title: titleText, noteText: noteText)
                        }
                        
                        withAnimation {
                            notes = []
                            notes = Array(RealmManager.shared.notes)
                            isNewNoteShown.toggle()
                        }
                        titleText = ""
                        noteText = ""
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 150, height: 50)
                                .foregroundStyle(.cutsomOrange)
                            
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(lineWidth: 2)
                                .frame(width: 150, height: 50)
                                .foregroundStyle(.white)
                            
                            Text("Save")
                                .foregroundStyle(.white)
                        }
                    }
                    
                    Spacer()
                }
            }
            .ignoresSafeArea()
            .background(.thinMaterial)
        }
        .onAppear {
            notes = Array(RealmManager.shared.notes)
        }
    }
}

#Preview {
    SportNotesView()
}
