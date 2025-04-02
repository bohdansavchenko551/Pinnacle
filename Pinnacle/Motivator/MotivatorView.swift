//
//  MotivatorView.swift
//  Pinnacle
//
//  Created by D K on 01.04.2025.
//

import SwiftUI

struct MotivatorView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isShowingMotivation: Bool = false
        @State private var selectedMotivation: MotivationTheme? = nil
        @State private var currentCardIndex: Int = 0

    
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
                    
                    Text("Motivator")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .black))
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                
                if !isShowingMotivation {
                    
                    Text("""
Don't you want to go to training? \nLet me help you.
""")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .font(.system(size: 32, weight: .semibold))
                    .padding(.top, 30)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            startMotivation()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 150, height: 70)
                                .foregroundStyle(.cutsomOrange)
                            
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(lineWidth: 3)
                                .foregroundStyle(.white)
                                .frame(width: 150, height: 70)
                            
                            Text("Start")
                                .foregroundStyle(.white)
                                .font(.system(size: 24))
                                .bold()
                        }
                    }
                    
                    Spacer()
                } else if let motivation = selectedMotivation {
                                   if currentCardIndex < motivation.cards.count {
                                       VStack(spacing: 20) {
                                           
                                           Spacer()
                                           
                                           RoundedRectangle(cornerRadius: 24)
                                               .frame(width: size().width - 30, height: 180)
                                               .foregroundStyle(.semiBlue)
                                               .overlay {
                                                   RoundedRectangle(cornerRadius: 24)
                                                       .stroke(lineWidth: 4)
                                                       .foregroundStyle(.white)
                                               }
                                               .overlay {
                                                   Text(motivation.cards[currentCardIndex].text)
                                                       .foregroundStyle(.white)
                                                       .font(.system(size: 24, weight: .black))
                                                       .padding(.horizontal)
                                                       .multilineTextAlignment(.center)
                                               }
                                           

                                           Spacer()
                                           
                                           Button {
                                               withAnimation {
                                                   currentCardIndex += 1
                                               }
                                           } label: {
                                               ZStack {
                                                   RoundedRectangle(cornerRadius: 24)
                                                       .frame(width: 150, height: 70)
                                                       .foregroundStyle(.cutsomOrange)
                                                   
                                                   RoundedRectangle(cornerRadius: 24)
                                                       .stroke(lineWidth: 3)
                                                       .foregroundStyle(.white)
                                                       .frame(width: 150, height: 70)
                                                   
                                                   Text("Next")
                                                       .foregroundStyle(.white)
                                                       .font(.system(size: 24))
                                                       .bold()
                                               }
                                           }
                                           Spacer()
                                       }
                                   } else {
                                       VStack(spacing: 20) {
                                           Spacer()
                                           Text("Great job!\nYou've got the motivation. Now go train!")
                                               .multilineTextAlignment(.center)
                                               .foregroundStyle(.white)
                                               .font(.system(size: 32, weight: .semibold))
                                               .padding(.top, 30)
                                               .padding(.horizontal)
                                           
                                           Spacer()
                                           
                                           Button {
                                               withAnimation {
                                                   resetToStart()
                                               }
                                           } label: {
                                               ZStack {
                                                   RoundedRectangle(cornerRadius: 24)
                                                       .frame(width: 150, height: 70)
                                                       .foregroundStyle(.cutsomOrange)
                                                   
                                                   RoundedRectangle(cornerRadius: 24)
                                                       .stroke(lineWidth: 3)
                                                       .foregroundStyle(.white)
                                                       .frame(width: 150, height: 70)
                                                   
                                                   Text("Close")
                                                       .foregroundStyle(.white)
                                                       .font(.system(size: 24))
                                                       .bold()
                                               }
                                           }
                                           Spacer()
                                       }
                                   }
                }
                Spacer()
            }
        }
    }
    
    // Функция для начала сеанса мотивации
       private func startMotivation() {
           selectedMotivation = allMotivations.randomElement() // Выбираем случайную тему
           currentCardIndex = 0 // Сбрасываем индекс карточки
           isShowingMotivation = true // Переключаем флаг отображения
       }

       // Функция для сброса в начальное состояние (альтернатива dismiss)
       private func resetToStart() {
           isShowingMotivation = false
           selectedMotivation = nil
           currentCardIndex = 0
       }
    
    // Array with all motivation themes
    let allMotivations: [MotivationTheme] = [
        // Theme 1: Overcoming Inertia
        MotivationTheme(name: "Overcoming Inertia", cards: [
            MotivationCard(text: "The hardest step is the first one. Just start moving, even a little."),
            MotivationCard(text: "Remember that feeling of satisfaction AFTER a workout? It's worth it!"),
            MotivationCard(text: "5 minutes of activity is better than 0. Don't think about the whole workout, start small."),
            MotivationCard(text: "Your couch isn't going anywhere. But the opportunity to become stronger and healthier might slip away."),
            MotivationCard(text: "You can do more than you think right now. Just take the first step!")
        ]),

        // Theme 2: Health Focus
        MotivationTheme(name: "Health Focus", cards: [
            MotivationCard(text: "Every workout is an investment in your longevity and well-being."),
            MotivationCard(text: "Movement improves blood circulation and brain function. Feel the mental clarity!"),
            MotivationCard(text: "Strengthen your heart and blood vessels. Your body will thank you."),
            MotivationCard(text: "Regular exercise helps combat stress and improves sleep."),
            MotivationCard(text: "You are building a healthier, more energetic version of yourself. Go for it!")
        ]),

        // Theme 3: Strength & Endurance
        MotivationTheme(name: "Strength & Endurance", cards: [
            MotivationCard(text: "Imagine how you get stronger with every workout."),
            MotivationCard(text: "By pushing yourself today, you're laying the foundation for future victories."),
            MotivationCard(text: "The feeling of strength and control over your body is incredible!"),
            MotivationCard(text: "Endurance isn't just about sports, it's about achieving goals in life."),
            MotivationCard(text: "You can lift that weight / run that distance! Believe in yourself!")
        ]),

        // Theme 4: Positive Emotions
        MotivationTheme(name: "Positive Emotions", cards: [
            MotivationCard(text: "Exercise is a great way to boost your mood. Endorphins are waiting!"),
            MotivationCard(text: "Release negativity through physical activity. Leave only positivity behind."),
            MotivationCard(text: "The pride in yourself after completing a workout is priceless."),
            MotivationCard(text: "Feel the energy and vigor that movement brings."),
            MotivationCard(text: "Smile! You're doing something beneficial and enjoyable for yourself.")
        ]),

        // Theme 5: Discipline & Goals
        MotivationTheme(name: "Discipline & Goals", cards: [
            MotivationCard(text: "Discipline is the bridge between goals and accomplishment. Build your bridge."),
            MotivationCard(text: "Every workout brings you closer to your fitness (and other) goals."),
            MotivationCard(text: "Today's effort is tomorrow's result. Don't give up!"),
            MotivationCard(text: "By showing yourself you can be disciplined in sports, you prove you can be disciplined in everything."),
            MotivationCard(text: "You are building a habit that will change your life for the better.")
        ]),

        // Theme 6: Just Start
        MotivationTheme(name: "Just Start", cards: [
            MotivationCard(text: "Don't think. Just put on your sneakers."),
            MotivationCard(text: "Open the door and go outside / roll out your mat."),
            MotivationCard(text: "Do one exercise. Just one."),
            MotivationCard(text: "Turn on some music and move for a couple of minutes."),
            MotivationCard(text: "You've already started! Keep it up!")
        ])
    ]
}

#Preview {
    MotivatorView()
}




struct MotivationCard: Identifiable {
    let id = UUID() // Уникальный идентификатор для списков
    let text: String
}

// Структура для одной темы мотивации (объекта)
struct MotivationTheme: Identifiable {
    let id = UUID()
    let name: String // На всякий случай, если захотите отображать название темы
    let cards: [MotivationCard]
}
