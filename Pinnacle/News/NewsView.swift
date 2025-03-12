//
//  NewsView.swift
//  Pinnacle
//
//  Created by D K on 11.03.2025.
//

import SwiftUI

class NewsElement: Identifiable {
    var id = UUID()
    var newsTitle: String
    var newsDescription: String
    var newsImage: String
    
    init(newsTitle: String, newsDescription: String, newsImage: String) {
        self.newsTitle = newsTitle
        self.newsDescription = newsDescription
        self.newsImage = newsImage
    }
}

struct NewsView: View {
    
    @State private var currentNewsIndex: Int = 0
    @State private var itemtoShow: NewsElement?
    
    var news: [NewsElement] = [
    NewsElement(newsTitle: "Join Our Team: We’re Looking for New Coaches!", newsDescription: """
Are you passionate about sports and eager to make a difference? Our volunteer sports club is expanding, and we are looking for enthusiastic coaches to join our team! Whether you specialize in soccer, basketball, running, or any other sport, we welcome individuals who are motivated to inspire and train our members.

As a volunteer coach, you’ll have the opportunity to work with athletes of all levels, help them develop their skills, and be part of a supportive community that values teamwork and personal growth. If you’re interested in joining us, please send your application to your_email@example.com. Let’s build something great together!
"""
                , newsImage: "new1"),
    NewsElement(newsTitle: "Community Sports Day: Join the Fun!", newsDescription: """
Get ready for an exciting day of sports, games, and fun! Our club is organizing a Community Sports Day, and everyone is invited to participate. Whether you’re an experienced athlete or just looking to have a good time, there will be activities for all skill levels.

The event will feature friendly competitions, team challenges, and opportunities to try new sports. It’s a great way to stay active, meet new people, and celebrate the spirit of our club. Stay tuned for the date and location—we can’t wait to see you there!
""", newsImage: "new2"),
    NewsElement(newsTitle: "New Training Sessions: Improve Your Skills!", newsDescription: """
We’re excited to introduce new training sessions at our club! Whether you want to enhance your speed, strength, or technical skills, our experienced volunteers have designed specialized workouts to help you improve.

These sessions are open to all members and cater to different fitness levels. No matter if you’re a beginner or an advanced athlete, you’ll find a supportive environment where you can push your limits and achieve your goals. Join us for our next session and take your performance to the next level!
""", newsImage: "new3")
    ]
    
    let sportsTips = [
        NewsElement(
            newsTitle: "Master Close Ball Control",
            newsDescription: "To improve your dribbling skills in soccer, practice close ball control with both feet. Set up cones or small markers and maneuver through them at different speeds. Focus on keeping the ball close while maintaining control under pressure. Try using the inside and outside of your foot to change directions quickly. Practicing this regularly will enhance your agility and ball-handling ability, making it harder for defenders to take possession.",
            newsImage: "tip1"
        ),
        NewsElement(
            newsTitle: "Improve Your Shooting Accuracy",
            newsDescription: "Shooting accurately in soccer requires a combination of technique and practice. Focus on striking the ball with the correct part of your foot—inside for placement shots, instep for power. Set up a goal with target zones and challenge yourself to hit specific spots consistently. Use both feet to develop versatility. Practicing different shooting techniques such as volleys, curve shots, and one-touch finishes will significantly improve your goal-scoring ability.",
            newsImage: "tip2"
        ),
        NewsElement(
            newsTitle: "Enhance Ball Handling Skills",
            newsDescription: "To become a better basketball player, focus on dribbling drills that enhance ball control and coordination. Practice dribbling with both hands at different speeds, using crossovers, behind-the-back, and between-the-legs moves. Incorporate reaction drills where you change direction based on an external cue. Keeping your eyes up while dribbling will also improve your court awareness and decision-making.",
            newsImage: "tip3"
        ),
        NewsElement(
            newsTitle: "Develop a Consistent Shooting Form",
            newsDescription: "Shooting consistency in basketball is crucial for scoring efficiency. Focus on having a stable stance, aligning your shooting hand with the basket, and following through on every shot. Use repetition to engrain muscle memory—practice mid-range shots, three-pointers, and free throws with a consistent rhythm. Visualization techniques can also help improve accuracy by mentally reinforcing successful shots.",
            newsImage: "tip4"
        ),
        NewsElement(
            newsTitle: "Master Your Footwork",
            newsDescription: "In tennis, footwork is the foundation of all great shots. Practice split-step timing to improve reaction speed and agility. Work on lateral movements, short sprints, and quick changes in direction to ensure you can reach every ball efficiently. Incorporating agility ladder drills and shadow swings will refine your positioning, helping you set up for each shot with optimal balance and control.",
            newsImage: "tip5"
        ),
        NewsElement(
            newsTitle: "Enhance Your Serve Power and Accuracy",
            newsDescription: "A powerful and accurate serve can give you a significant advantage in tennis. Focus on proper stance, ball toss consistency, and wrist snap at the point of contact. Practice different types of serves—flat, slice, and kick—to keep opponents guessing. Strengthening your shoulder and core muscles will also add more power to your serves while maintaining accuracy under pressure.",
            newsImage: "tip6"
        ),
        NewsElement(
            newsTitle: "Improve Your Skating Speed and Agility",
            newsDescription: "Speed and agility are essential for hockey players. Work on explosive starts, quick stops, and crossovers to maximize mobility. Practice tight turns and edge control to maintain speed while maneuvering around opponents. Off-ice training, such as plyometric exercises and resistance band drills, can further enhance your acceleration and agility on the ice.",
            newsImage: "tip7"
        ),
        NewsElement(
            newsTitle: "Master Puck Handling Under Pressure",
            newsDescription: "Great puck control allows hockey players to evade defenders and create scoring opportunities. Practice stickhandling drills with cones, obstacles, or even weighted pucks to improve your precision. Work on dekes, toe drags, and quick hand movements to increase your ability to maneuver in tight spaces. Keeping your head up while handling the puck will also improve your awareness and decision-making on the ice.",
            newsImage: "tip8"
        ),
        NewsElement(
            newsTitle: "Develop Stronger Blocking and Defensive Skills",
            newsDescription: "Effective blocking and defensive skills are crucial in volleyball. Work on your positioning, timing, and reaction speed to anticipate the opponent’s attack. Practicing explosive vertical jumps and strengthening your core will help you maintain balance and power in defensive situations. Communication with teammates is also key to forming a solid defensive strategy.",
            newsImage: "tip9"
        ),
        NewsElement(
            newsTitle: "Improve Your Spike Accuracy and Power",
            newsDescription: "A powerful and accurate spike can be a game-changer in volleyball. Focus on your approach steps, arm swing mechanics, and contact point to maximize efficiency. Practicing different angles and shot placements will make your attacks more unpredictable. Strength training, particularly for your shoulders and legs, will add extra force to your spikes, making them harder to defend.",
            newsImage: "tip10"
        )
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.darkBlue)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Text("News")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .thin))
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    GeometryReader { geometry in
                        TabView(selection: $currentNewsIndex) {
                            ForEach(0..<news.count, id: \.self) { index in
                                NewsCell(news: news[index]) {
                                    itemtoShow = news[index]
                                }
                            }
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .frame(width: size().width, height: 230)
                    .padding(.top, -20)
                    
                    Text("Tips")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .thin))
                        .multilineTextAlignment(.center)
                        .padding(.top, -20)
                    
                    VStack {
                        ForEach(sportsTips, id: \.newsImage) { news in
                            NewsCell(news: news) {
                                itemtoShow = news
                            }
                        }
                        
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .fullScreenCover(item: $itemtoShow) { item in
            NewsDetailView(news: item)
        }
    }
}

#Preview {
    NewsView()
}
