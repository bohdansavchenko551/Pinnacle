//
//  PresonalTrainer.swift
//  Pinnacle
//
//  Created by D K on 01.04.2025.
//

import SwiftUI

struct PresonalTrainer: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var viewModel = TrainerViewModel()
    
    @State private var text = ""
    
    @State private var isAlertShown = false
    
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
                    
                    Text("Presonal Trainer")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .black))
                       // .padding(.trailing)
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                
                RoundedRectangle(cornerRadius: 24)
                    .foregroundStyle(.semiBlue)
                    .overlay {
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.white)
                        
                    }
                    .padding(.bottom)
                    .frame(width: size().width - 20)
                    .overlay {
                        ScrollView {
                            VStack(alignment: .leading) {
                                if let error = viewModel.errorMessage {
                                    Text("Error: \(error)")
                                        .foregroundColor(.white)
                                        .font(.caption)
                                }
                                
                                if !text.isEmpty {
                                    HStack {
                                        Text(text)
                                            .foregroundStyle(.gray)
                                            .padding(.bottom)
                                            .padding(.leading, 10)
                                            .padding(.top, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            RealmManager.shared.saveNote(title: text, noteText: viewModel.aiResponse)
                                            isAlertShown.toggle()
                                        } label: {
                                            ZStack {
                                                Image("tabIcon")
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 40, height: 40)
                                                
                                                Image(systemName: "star")
                                                    .foregroundStyle(.white)
                                                    .bold()
                                                    .padding(.bottom, 6)
                                                
                                            }
                                        }
                                        .alert("The answer has been saved in Sports Notes", isPresented: $isAlertShown) {
                                            Text("Ok")
                                        }
                                    }
                                  
                                }
                                
                                Text(viewModel.aiResponse)
                                    .font(.system(size: 24, design: .monospaced))
                                    .foregroundStyle(.white)
                                    .frame(width: size().width - 80, alignment: .leading)
                                    .padding(.horizontal, 10)
                            }
                            
                        }
                        .frame(width: size().width - 40)
                        .padding()
                    }
                
                HStack {
                    TextField("Type your question here", text: $viewModel.userQuestion, axis: .vertical)
                        .onSubmit(viewModel.sendQuestion)
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
                    
                    Button {
                        withAnimation {
                            viewModel.sendQuestion()
                            text = viewModel.userQuestion
                            viewModel.userQuestion = ""
                        }
                    } label: {
                        ZStack {
                            Image("tabIcon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                            
                            if viewModel.isLoading {
                                ProgressView()
                                    .frame(width: 50, height: 50)
                                    .padding(.bottom, 6)
                            } else {
                                Image(systemName: "paperplane")
                                    .foregroundStyle(.white)
                                    .bold()
                                    .padding(.bottom, 6)
                            }
                            
                        }
                    }
                    .disabled(viewModel.isLoading || viewModel.userQuestion.isEmpty)
                    .padding(.top, 5)
                }
                .padding(.bottom)
                .padding(.horizontal, 10)
                
                Spacer()
            }
        }
    }
}

#Preview {
    PresonalTrainer()
}



class TrainerViewModel: ObservableObject {
     @Published var userQuestion: String = ""
     @Published var aiResponse: String = "Hello! \nAsk me a question about training."
     @Published var isLoading: Bool = false
     @Published var errorMessage: String? = nil // Для отображения ошибок

     private let unsafeApiKey = "AIzaSyDeKZRT21892LO6NjoSWdWgq3OfXeiOG1c" // ЗАМЕНИТЕ НА ВАШ КЛЮЧ

     private lazy var trainerManager = AITrainerManager(apiKey: unsafeApiKey) // Передаем ключ при инициализации

     func sendQuestion() {
         guard !userQuestion.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
             errorMessage = "Please enter your question."
             return
         }

         isLoading = true
         errorMessage = nil
         aiResponse = "Thinking about the answer..." // Промежуточное состояние

         trainerManager.sendMessage(prompt: userQuestion) { [weak self] result in
             self?.isLoading = false
             switch result {
             case .success(let responseText):
                 self?.aiResponse = responseText
                 self?.userQuestion = "" // Очистить поле ввода после успеха
             case .failure(let error):
                 self?.errorMessage = error.localizedDescription
                 self?.aiResponse = "An error occurred..."
             }
         }
     }
 }
