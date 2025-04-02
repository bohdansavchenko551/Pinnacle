//
//  HomeSportView.swift
//  Pinnacle
//
//  Created by D K on 01.04.2025.
//

import SwiftUI

struct HomeTraining: Identifiable {
    var id = UUID()
    var title: String
    var training: String
    var image: String
}

struct SportItem: Identifiable {
    let id: Int
    let image: String
    var offset: CGFloat = 0
    var zIndex: Double
    
}

struct CardSportView: View {
    
    @State private var selectedIndex = 0
    @Binding private var selectedCardIndex: Int
    @State private var items: [SportItem]
    let imageSize: CGSize
    let maximumOffset: CGFloat
    
    @State var selectedTraining: HomeTraining?
    
    init(images: [String], selectedCardIndex: Binding<Int>? = nil,
         imageSize: CGSize = CGSize(width: 100, height: 150)) {
        var createdItems = [SportItem]()
        for (id, image) in images.enumerated() {
            createdItems.append(SportItem(id: id, image: image, zIndex:
                                            Double(images.count - 1 - id)))
        }
        self._selectedCardIndex = selectedCardIndex ?? .constant(0)
        self.items = createdItems
        self.imageSize = imageSize
        self.maximumOffset = imageSize.width * 0.75
    }
    
    var body: some View {
        ZStack {
            ForEach(items) { item in
                ZStack {
                    Image(item.image).resizable().scaledToFill()
                        .frame(width: imageSize.width, height: imageSize.height)
                        .cornerRadius(12)
                        .shadow(color: Color.semiBlue, radius: 10)
                    
                    Text(homeWorkouts[item.id].title)
                        .foregroundStyle(.white)
                        .font(.system(size: 28, weight: .black))
                        .shadow(color: .black, radius: 10)
                        .frame(width: 150)
                        .multilineTextAlignment(.center)
                    
                }
                    .offset(x: item.offset)
                    .zIndex(item.zIndex)
                    .rotation3DEffect(
                        .degrees(item.offset / maximumOffset * -25.0),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .rotationEffect(
                        .degrees(
                            item.id == selectedIndex ?
                            (item.offset / maximumOffset * 10.0)
                            :
                                item.id % 2 == 0 ?
                            (15 * (1 - (abs(items[selectedIndex].offset / maximumOffset))))
                            :
                                (-15 * (1 - (abs(items[selectedIndex].offset / maximumOffset))))
                        ),
                        anchor: item.id % 2 == 0 ?
                            .bottomLeading
                        :
                                .bottomTrailing
                    )
                    .scaleEffect(
                        item.id == selectedIndex ?
                        
                        CGSize(
                            width: 1 - (abs(item.offset / maximumOffset) * 0.5),
                            height: 1 - (abs(item.offset / maximumOffset) * 0.3)
                        )
                        :
                            CGSize(
                                width: 0.8 + (0.2 * abs(items[selectedIndex].offset / maximumOffset)),
                                height: 0.8 + (0.2 * abs(items[selectedIndex].offset / maximumOffset))
                            )
                    )
                    .offset(x: item.offset / 4)
                    .containerShape(Rectangle())
                    .gesture(
                        item.id != selectedIndex ? nil : DragGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 0.1)) {
                                    if abs(value.translation.width) <= maximumOffset {
                                        items[selectedIndex].offset = value.translation.width
                                        withAnimation {
                                            items[selectedIndex].zIndex = Double(items.count - 1)
                                        }
                                    } else {
                                        items[selectedIndex].zIndex = 0
                                    }
                                }
                            })
                            .onEnded({ value in
                                if abs(value.translation.width) > maximumOffset {
                                    items.forEach { items[$0.id].zIndex += 1 }
                                    items[selectedIndex].zIndex = 0
                                }
                                
                                withAnimation {
                                    items[selectedIndex].offset = .zero
                                    selectedIndex = items.first(where: { $0.zIndex == Double(items.count - 1)})?.id
                                    ?? 0
                                    selectedCardIndex = selectedIndex
                                }
                            })
                    )
                    .onTapGesture {
                        selectedTraining = homeWorkouts[item.id]
                    }
            }
        }
        .fullScreenCover(item: $selectedTraining) { training in
            HomeTrainingDetailView(image: training.image, title: training.title, training: training.training)
        }
    }
    
    let homeWorkouts: [HomeTraining] = [
        HomeTraining(
            title: "Full Body Blast",
            training: "10 push-ups, 15 squats, 20 jumping jacks, 10 sit-ups. Repeat 3 times with 1-minute rest between rounds.",
            image: "tr1"
        ),
        HomeTraining(
            title: "Core Crusher",
            training: "20 crunches, 15 plank leg raises, 30-second plank hold, 10 bicycle crunches per side. Repeat 3 times.",
            image: "tr2"
        ),
        HomeTraining(
            title: "Leg Day Challenge",
            training: "15 lunges per leg, 20 squats, 10 calf raises, 30-second wall sit. Repeat 3 times with 1-minute rest.",
            image: "tr3"
        ),
        HomeTraining(
            title: "Upper Body Burn",
            training: "12 push-ups, 15 tricep dips (using a chair), 20 arm circles (10 forward, 10 backward). Repeat 3 times.",
            image: "tr4"
        ),
        HomeTraining(
            title: "Cardio Kickstart",
            training: "30 high knees, 20 mountain climbers, 15 burpees, 30-second rest. Repeat 4 times.",
            image: "tr5"
        ),
        HomeTraining(
            title: "Flexibility Flow",
            training: "5-minute stretch: hamstring stretch (30s per leg), cat-cow pose (1 min), downward dog (1 min), child’s pose (1 min).",
            image: "tr6"
        ),
        HomeTraining(
            title: "Quick HIIT",
            training: "20 seconds of squat jumps, 20 seconds of push-ups, 20 seconds of plank, 40-second rest. Repeat 5 times.",
            image: "tr7"
        )
    ]
}

