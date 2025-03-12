//
//  DataManager.swift
//  Pinnacle
//
//  Created by D K on 10.03.2025.
//

import Foundation


class DataManager {
    
    static let shared = DataManager()
    
    private init(){
    }
    
    let football: [Training] = [
        Training(
            title: "Basic Skills Training",
            date: "2025-03-17",
            time: "18:00",
            location: "7401 Martin Grove Rd, Woodbridge, ON L4L 9E4",
            coachName: "Jan Smit",
            description: "Focus on passing and ball control.",
            itemsToBring: "Cleats, water bottle, shin guards"
        ),
        Training(
            title: "Advanced Tactics",
            date: "2025-03-19",
            time: "19:00",
            location: "2E2, 71 Carl Hall Rd, North York, ON",
            coachName: "Pieter De Wit",
            description: "Learn advanced positioning and team strategies.",
            itemsToBring: "Cleats, water bottle, notebook"
        ),
        Training(
            title: "Goalkeeper Training",
            date: "2025-03-24",
            time: "17:30",
            location: "55 Ethennonnhawahstihnen' Ln, North York, ON M2K 1H8",
            coachName: "Mark Van der Meer",
            description: "Specialized training for goalkeepers.",
            itemsToBring: "Gloves, cleats, water bottle"
        ),
        Training(
            title: "Fitness and Conditioning",
            date: "2025-03-28",
            time: "09:00",
            location: "7401 Martin Grove Rd, Woodbridge, ON L4L 9E4",
            coachName: "Jan Smit",
            description: "Improve stamina and strength.",
            itemsToBring: "Running shoes, water bottle, towel"
        ),
        Training(
            title: "Youth Development",
            date: "2025-04-03",
            time: "10:00",
            location: "2E2, 71 Carl Hall Rd, North York, ON",
            coachName: "Pieter De Wit",
            description: "Training for young players aged 10-14.",
            itemsToBring: "Cleats, water bottle, shin guards"
        ),
        Training(
            title: "Shooting Practice",
            date: "2025-04-07",
            time: "18:30",
            location: "55 Ethennonnhawahstihnen' Ln, North York, ON M2K 1H8",
            coachName: "Mark Van der Meer",
            description: "Focus on shooting accuracy and power.",
            itemsToBring: "Cleats, water bottle, shin guards"
        ),
        Training(
            title: "Defensive Drills",
            date: "2025-04-10",
            time: "19:00",
            location: "55 Ethennonnhawahstihnen' Ln, North York, ON M2K 1H8",
            coachName: "Mark Van der Meer",
            description: "Improve defensive skills and teamwork.",
            itemsToBring: "Cleats, water bottle, shin guards"
        ),
        Training(
            title: "Match Simulation",
            date: "2025-04-13",
            time: "11:00",
            location: "55 Ethennonnhawahstihnen' Ln, North York, ON M2K 1H8",
            coachName: "Thomas Baker",
            description: "Full match simulation to practice strategies.",
            itemsToBring: "Cleats, water bottle, shin guards"
        ),
        Training(
            title: "Set Pieces Training",
            date: "2025-04-16",
            time: "18:00",
            location: "7401 Martin Grove Rd, Woodbridge, ON L4L 9E4",
            coachName: "Jan Smit",
            description: "Practice free kicks, corners, and penalties.",
            itemsToBring: "Cleats, water bottle, shin guards"
        ),
        Training(
            title: "Recovery Session",
            date: "2025-04-19",
            time: "10:00",
            location: "55 Ethennonnhawahstihnen' Ln, North York, ON M2K 1H8",
            coachName: "Thomas Baker",
            description: "Light training focused on recovery and flexibility.",
            itemsToBring: "Running shoes, water bottle, yoga mat"
        )
    ]
    
    let basketball: [Training] = [
        Training(
            title: "Beginner Dribbling Drills",
            date: "2025-03-14",
            time: "17:00",
            location: "140 Antibes Dr, North York, ON M2R 3J3",
            coachName: "Luka Van Dijk",
            description: "Learn basic dribbling techniques and ball control.",
            itemsToBring: "Basketball, water bottle, sports shoes"
        ),
        Training(
            title: "Shooting Fundamentals",
            date: "2025-03-18",
            time: "18:30",
            location: "140 Antibes Dr, North York, ON M2R 3J3",
            coachName: "Luka Van Dijk",
            description: "Focus on shooting form and accuracy.",
            itemsToBring: "Basketball, water bottle, towel"
        ),
        Training(
            title: "Defensive Strategies",
            date: "2025-03-23",
            time: "19:00",
            location: "3701 Chesswood Dr Suite 116, North York, ON M3J 2P6",
            coachName: "Nicolas Janssen",
            description: "Improve defensive positioning and footwork.",
            itemsToBring: "Basketball, water bottle, notebook"
        ),
        Training(
            title: "Advanced Passing Techniques",
            date: "2025-03-28",
            time: "10:00",
            location: "140 Antibes Dr, North York, ON M2R 3J3",
            coachName: "Luka Van Dijk",
            description: "Practice advanced passing and teamwork.",
            itemsToBring: "Basketball, water bottle, sports shoes"
        ),
        Training(
            title: "Rebounding and Boxing Out",
            date: "2025-04-03",
            time: "17:30",
            location: "3701 Chesswood Dr Suite 116, North York, ON M3J 2P6",
            coachName: "Nicolas Janssen",
            description: "Learn how to dominate the boards.",
            itemsToBring: "Basketball, water bottle, towel"
        ),
        Training(
            title: "Speed and Agility Training",
            date: "2025-04-05",
            time: "18:00",
            location: "140 Antibes Dr, North York, ON M2R 3J3",
            coachName: "Luka Van Dijk",
            description: "Improve speed, agility, and court movement.",
            itemsToBring: "Sports shoes, water bottle, towel"
        ),
        Training(
            title: "Three-Point Shooting Clinic",
            date: "2025-04-08",
            time: "11:00",
            location: "3701 Chesswood Dr Suite 116, North York, ON M3J 2P6",
            coachName: "Nicolas Janssen",
            description: "Master the art of three-point shooting.",
            itemsToBring: "Basketball, water bottle, sports shoes"
        ),
        Training(
            title: "Team Play and Strategy",
            date: "2025-04-10",
            time: "19:00",
            location: "140 Antibes Dr, North York, ON M2R 3J3",
            coachName: "Luka Van Dijk",
            description: "Focus on team dynamics and game strategies.",
            itemsToBring: "Basketball, water bottle, notebook"
        ),
        Training(
            title: "Youth Basketball Camp",
            date: "2025-04-13",
            time: "10:00",
            location: "3701 Chesswood Dr Suite 116, North York, ON M3J 2P6",
            coachName: "Nicolas Janssen",
            description: "Training for young players aged 8-12.",
            itemsToBring: "Basketball, water bottle, sports shoes"
        ),
        Training(
            title: "Recovery and Stretching Session",
            date: "2025-04-18",
            time: "09:00",
            location: "140 Antibes Dr, North York, ON M2R 3J3",
            coachName: "Luka Van Dijk",
            description: "Light session focused on recovery and flexibility.",
            itemsToBring: "Yoga mat, water bottle, towel"
        )
    ]
    
    let tennis: [Training] = [
        Training(
            title: "Beginner Forehand and Backhand",
            date: "2025-03-16",
            time: "16:00",
            location: "197 Avondale Ave, North York, ON M2N 2V4",
            coachName: "Steven Vermeer",
            description: "Learn the basics of forehand and backhand strokes.",
            itemsToBring: "Tennis racket, tennis balls, water bottle"
        ),
        Training(
            title: "Serve Mastery",
            date: "2025-03-18",
            time: "17:30",
            location: "230 Wanless Ave, Toronto, ON M4N 1V6",
            coachName: "Robin Taylor",
            description: "Focus on improving your serve technique.",
            itemsToBring: "Tennis racket, tennis balls, water bottle"
        ),
        Training(
            title: "Volley and Net Play",
            date: "2025-04-20",
            time: "18:00",
            location: "230 Wanless Ave, Toronto, ON M4N 1V6",
            coachName: "Robin Taylor",
            description: "Practice volleys and net strategies.",
            itemsToBring: "Tennis racket, tennis balls, water bottle"
        ),
        Training(
            title: "Footwork and Agility",
            date: "2025-04-22",
            time: "09:00",
            location: "197 Avondale Ave, North York, ON M2N 2V4",
            coachName: "Steven Vermeer",
            description: "Improve movement and court coverage.",
            itemsToBring: "Tennis shoes, water bottle, towel"
        ),
        Training(
            title: "Advanced Groundstrokes",
            date: "2025-04-24",
            time: "17:00",
            location: "230 Wanless Ave, Toronto, ON M4N 1V6",
            coachName: "Robin Taylor",
            description: "Work on powerful and accurate groundstrokes.",
            itemsToBring: "Tennis racket, tennis balls, water bottle"
        ),
        Training(
            title: "Doubles Strategies",
            date: "2025-04-26",
            time: "18:30",
            location: "197 Avondale Ave, North York, ON M2N 2V4",
            coachName: "Steven Vermeer",
            description: "Learn tactics for doubles matches.",
            itemsToBring: "Tennis racket, tennis balls, water bottle"
        ),
        Training(
            title: "Mental Toughness Training",
            date: "2025-04-28",
            time: "10:00",
            location: "230 Wanless Ave, Toronto, ON M4N 1V6",
            coachName: "Robin Taylor",
            description: "Develop mental resilience and focus.",
            itemsToBring: "Notebook, water bottle, towel"
        ),
        Training(
            title: "Youth Tennis Camp",
            date: "2025-04-30",
            time: "11:00",
            location: "197 Avondale Ave, North York, ON M2N 2V4",
            coachName: "Steven Vermeer",
            description: "Training for young players aged 10-15.",
            itemsToBring: "Tennis racket, tennis balls, water bottle"
        ),
        Training(
            title: "Match Play Simulation",
            date: "2025-04-02",
            time: "19:00",
            location: "230 Wanless Ave, Toronto, ON M4N 1V6",
            coachName: "Robin Taylor",
            description: "Simulate real match conditions.",
            itemsToBring: "Tennis racket, tennis balls, water bottle"
        ),
        Training(
            title: "Recovery and Stretching Session",
            date: "2025-04-06",
            time: "09:30",
            location: "197 Avondale Ave, North York, ON M2N 2V4",
            coachName: "Steven Vermeer",
            description: "Light session for recovery and flexibility.",
            itemsToBring: "Yoga mat, water bottle, towel"
        )
    ]
    
    let hockey: [Training] = [
        Training(
            title: "Beginner Skating Skills",
            date: "2025-03-15",
            time: "17:00",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Learn the basics of skating and balance.",
            itemsToBring: "Skates, helmet, gloves, water bottle"
        ),
        Training(
            title: "Stickhandling Drills",
            date: "2025-03-20",
            time: "18:30",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Improve puck control and stickhandling.",
            itemsToBring: "Stick, gloves, helmet, water bottle"
        ),
        Training(
            title: "Shooting Accuracy",
            date: "2025-03-25",
            time: "19:00",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Focus on shooting accuracy and power.",
            itemsToBring: "Stick, gloves, helmet, water bottle"
        ),
        Training(
            title: "Defensive Positioning",
            date: "2025-03-30",
            time: "17:30",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Learn defensive strategies and positioning.",
            itemsToBring: "Stick, gloves, helmet, water bottle"
        ),
        Training(
            title: "Power Skating",
            date: "2025-04-05",
            time: "18:00",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Improve speed and agility on the ice.",
            itemsToBring: "Skates, helmet, gloves, water bottle"
        ),
        Training(
            title: "Goaltending Basics",
            date: "2025-04-10",
            time: "10:00",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Training for beginner goalies.",
            itemsToBring: "Goalie gear, water bottle"
        ),
        Training(
            title: "Team Play and Passing",
            date: "2025-04-15",
            time: "19:00",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Practice passing and team coordination.",
            itemsToBring: "Stick, gloves, helmet, water bottle"
        ),
        Training(
            title: "Youth Hockey Development",
            date: "2025-04-20",
            time: "11:00",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Training for young players aged 8-12.",
            itemsToBring: "Skates, stick, helmet, gloves, water bottle"
        ),
        Training(
            title: "Game Simulation",
            date: "2025-04-25",
            time: "18:30",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Simulate real game situations.",
            itemsToBring: "Full gear, water bottle"
        ),
        Training(
            title: "Recovery and Stretching",
            date: "2025-04-30",
            time: "09:00",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Light session for recovery and flexibility.",
            itemsToBring: "Yoga mat, water bottle, towel"
        )
    ]
    
    let volleyball: [Training] = [
        Training(
            title: "Basic Passing Techniques",
            date: "2025-03-05",
            time: "17:00",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Wim Hees",
            description: "Learn the fundamentals of passing and receiving.",
            itemsToBring: "Knee pads, water bottle, sports shoes"
        ),
        Training(
            title: "Serving Fundamentals",
            date: "2025-03-10",
            time: "18:30",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Wim Hees",
            description: "Focus on proper serving techniques.",
            itemsToBring: "Volleyball, water bottle, sports shoes"
        ),
        Training(
            title: "Setting and Tossing",
            date: "2025-03-15",
            time: "19:00",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Wim Hees",
            description: "Practice setting and tossing accuracy.",
            itemsToBring: "Volleyball, water bottle, sports shoes"
        ),
        Training(
            title: "Spiking and Attacking",
            date: "2025-03-20",
            time: "17:30",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Wim Hees",
            description: "Improve spiking power and precision.",
            itemsToBring: "Volleyball, knee pads, water bottle"
        ),
        Training(
            title: "Blocking Strategies",
            date: "2025-03-25",
            time: "18:00",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Wim Hees",
            description: "Learn effective blocking techniques.",
            itemsToBring: "Volleyball, knee pads, water bottle"
        ),
        Training(
            title: "Defensive Drills",
            date: "2025-04-30",
            time: "10:00",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Wim Hees",
            description: "Focus on defensive positioning and digs.",
            itemsToBring: "Volleyball, knee pads, water bottle"
        ),
        Training(
            title: "Team Coordination",
            date: "2025-04-05",
            time: "19:00",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Wim Hees",
            description: "Practice team plays and communication.",
            itemsToBring: "Volleyball, knee pads, water bottle"
        ),
        Training(
            title: "Youth Volleyball Camp",
            date: "2025-04-10",
            time: "11:00",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Wim Hees",
            description: "Training for young players aged 10-14.",
            itemsToBring: "Volleyball, knee pads, water bottle"
        ),
        Training(
            title: "Game Simulation",
            date: "2025-04-15",
            time: "18:30",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Wim Hees",
            description: "Simulate real match conditions.",
            itemsToBring: "Volleyball, knee pads, water bottle"
        ),
        Training(
            title: "Recovery and Stretching",
            date: "2025-04-20",
            time: "09:00",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Wim Hees",
            description: "Light session for recovery and flexibility.",
            itemsToBring: "Yoga mat, water bottle, towel"
        )
    ]
}
