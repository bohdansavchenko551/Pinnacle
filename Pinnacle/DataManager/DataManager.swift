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
            date: "2025-03-28",
            time: "18:00",
            location: "7401 Martin Grove Rd, Woodbridge, ON L4L 9E4",
            coachName: "Ryan MacKenzie",
            description: "Focus on passing and ball control.",
            itemsToBring: "Cleats, water bottle, shin guards",
            icon: "fi1"
        ),
        Training(
            title: "Advanced Tactics",
            date: "2025-03-30",
            time: "19:00",
            location: "2E2, 71 Carl Hall Rd, North York, ON",
            coachName: "Ethan Tremblay",
            description: "Learn advanced positioning and team strategies.",
            itemsToBring: "Cleats, water bottle, notebook",
            icon: "fi2"
        ),
        Training(
            title: "Goalkeeper Training",
            date: "2025-04-04",
            time: "17:30",
            location: "55 Ethennonnhawahstihnen' Ln, North York, ON M2K 1H8",
            coachName: "Lucas O'Connor",
            description: "Specialized training for goalkeepers.",
            itemsToBring: "Gloves, cleats, water bottle",
            icon: "fi3"
        ),
        Training(
            title: "Fitness and Conditioning",
            date: "2025-04-08",
            time: "09:00",
            location: "7401 Martin Grove Rd, Woodbridge, ON L4L 9E4",
            coachName: "Nathan Bergeron",
            description: "Improve stamina and strength.",
            itemsToBring: "Running shoes, water bottle, towel",
            icon: "fi4"
        ),
        Training(
            title: "Youth Development",
            date: "2025-04-14",
            time: "10:00",
            location: "2E2, 71 Carl Hall Rd, North York, ON",
            coachName: "Owen Lavoie",
            description: "Training for young players aged 10-14.",
            itemsToBring: "Cleats, water bottle, shin guards",
            icon: "fi5"
        ),
        Training(
            title: "Shooting Practice",
            date: "2025-04-18",
            time: "18:30",
            location: "55 Ethennonnhawahstihnen' Ln, North York, ON M2K 1H8",
            coachName: "Liam Fontaine",
            description: "Focus on shooting accuracy and power.",
            itemsToBring: "Cleats, water bottle, shin guards",
            icon: "fi6"
        ),
        Training(
            title: "Defensive Drills",
            date: "2025-04-21",
            time: "19:00",
            location: "55 Ethennonnhawahstihnen' Ln, North York, ON M2K 1H8",
            coachName: "Aiden Bouchard",
            description: "Improve defensive skills and teamwork.",
            itemsToBring: "Cleats, water bottle, shin guards",
            icon: "fi7"
        ),
        Training(
            title: "Match Simulation",
            date: "2025-04-24",
            time: "11:00",
            location: "55 Ethennonnhawahstihnen' Ln, North York, ON M2K 1H8",
            coachName: "Connor Desjardins",
            description: "Full match simulation to practice strategies.",
            itemsToBring: "Cleats, water bottle, shin guards",
            icon: "fi8"
        ),
        Training(
            title: "Set Pieces Training",
            date: "2025-04-27",
            time: "18:00",
            location: "7401 Martin Grove Rd, Woodbridge, ON L4L 9E4",
            coachName: "Jacob Moreau",
            description: "Practice free kicks, corners, and penalties.",
            itemsToBring: "Cleats, water bottle, shin guards",
            icon: "fi9"
        ),
        Training(
            title: "Recovery Session",
            date: "2025-04-30",
            time: "10:00",
            location: "55 Ethennonnhawahstihnen' Ln, North York, ON M2K 1H8",
            coachName: "Sebastian Gagnon",
            description: "Light training focused on recovery and flexibility.",
            itemsToBring: "Running shoes, water bottle, yoga mat",
            icon: "fi10"
        )
    ]

    
    let basketball: [Training] = [
        Training(
            title: "Beginner Dribbling Drills",
            date: "2025-03-28",
            time: "17:00",
            location: "140 Antibes Dr, North York, ON M2R 3J3",
            coachName: "Carter Mitchell",
            description: "Learn basic dribbling techniques and ball control.",
            itemsToBring: "Basketball, water bottle, sports shoes",
            icon: "bi1"
        ),
        Training(
            title: "Shooting Fundamentals",
            date: "2025-04-01",
            time: "18:30",
            location: "140 Antibes Dr, North York, ON M2R 3J3",
            coachName: "Carter Mitchell",
            description: "Focus on shooting form and accuracy.",
            itemsToBring: "Basketball, water bottle, towel",
            icon: "bi2"
        ),
        Training(
            title: "Defensive Strategies",
            date: "2025-04-06",
            time: "19:00",
            location: "3701 Chesswood Dr Suite 116, North York, ON M3J 2P6",
            coachName: "Declan White",
            description: "Improve defensive positioning and footwork.",
            itemsToBring: "Basketball, water bottle, notebook",
            icon: "bi3"
        ),
        Training(
            title: "Advanced Passing Techniques",
            date: "2025-04-11",
            time: "10:00",
            location: "140 Antibes Dr, North York, ON M2R 3J3",
            coachName: "Carter Mitchell",
            description: "Practice advanced passing and teamwork.",
            itemsToBring: "Basketball, water bottle, sports shoes",
            icon: "bi4"
        ),
        Training(
            title: "Rebounding and Boxing Out",
            date: "2025-04-16",
            time: "17:30",
            location: "3701 Chesswood Dr Suite 116, North York, ON M3J 2P6",
            coachName: "Declan White",
            description: "Learn how to dominate the boards.",
            itemsToBring: "Basketball, water bottle, towel",
            icon: "bi5"
        ),
        Training(
            title: "Speed and Agility Training",
            date: "2025-04-18",
            time: "18:00",
            location: "140 Antibes Dr, North York, ON M2R 3J3",
            coachName: "Carter Mitchell",
            description: "Improve speed, agility, and court movement.",
            itemsToBring: "Sports shoes, water bottle, towel",
            icon: "bi6"
        ),
        Training(
            title: "Three-Point Shooting Clinic",
            date: "2025-04-21",
            time: "11:00",
            location: "3701 Chesswood Dr Suite 116, North York, ON M3J 2P6",
            coachName: "Declan White",
            description: "Master the art of three-point shooting.",
            itemsToBring: "Basketball, water bottle, sports shoes",
            icon: "bi7"
        ),
        Training(
            title: "Team Play and Strategy",
            date: "2025-04-23",
            time: "19:00",
            location: "140 Antibes Dr, North York, ON M2R 3J3",
            coachName: "Carter Mitchell",
            description: "Focus on team dynamics and game strategies.",
            itemsToBring: "Basketball, water bottle, notebook",
            icon: "bi8"
        ),
        Training(
            title: "Youth Basketball Camp",
            date: "2025-04-26",
            time: "10:00",
            location: "3701 Chesswood Dr Suite 116, North York, ON M3J 2P6",
            coachName: "Declan White",
            description: "Training for young players aged 8-12.",
            itemsToBring: "Basketball, water bottle, sports shoes",
            icon: "bi9"
        ),
        Training(
            title: "Recovery and Stretching Session",
            date: "2025-04-30",
            time: "09:00",
            location: "140 Antibes Dr, North York, ON M2R 3J3",
            coachName: "Carter Mitchell",
            description: "Light session focused on recovery and flexibility.",
            itemsToBring: "Yoga mat, water bottle, towel",
            icon: "bi10"
        )
    ]

    
    let tennis: [Training] = [
        Training(
            title: "Beginner Forehand and Backhand",
            date: "2025-03-28",
            time: "16:00",
            location: "197 Avondale Ave, North York, ON M2N 2V4",
            coachName: "Ryan Caldwell",
            description: "Learn the basics of forehand and backhand strokes.",
            itemsToBring: "Tennis racket, tennis balls, water bottle",
            icon: "ti1"
        ),
        Training(
            title: "Serve Mastery",
            date: "2025-03-30",
            time: "17:30",
            location: "230 Wanless Ave, Toronto, ON M4N 1V6",
            coachName: "Brandon McKenzie",
            description: "Focus on improving your serve technique.",
            itemsToBring: "Tennis racket, tennis balls, water bottle",
            icon: "ti2"
        ),
        Training(
            title: "Volley and Net Play",
            date: "2025-04-02",
            time: "18:00",
            location: "230 Wanless Ave, Toronto, ON M4N 1V6",
            coachName: "Brandon McKenzie",
            description: "Practice volleys and net strategies.",
            itemsToBring: "Tennis racket, tennis balls, water bottle",
            icon: "ti3"
        ),
        Training(
            title: "Footwork and Agility",
            date: "2025-04-04",
            time: "09:00",
            location: "197 Avondale Ave, North York, ON M2N 2V4",
            coachName: "Ryan Caldwell",
            description: "Improve movement and court coverage.",
            itemsToBring: "Tennis shoes, water bottle, towel",
            icon: "ti4"
        ),
        Training(
            title: "Advanced Groundstrokes",
            date: "2025-04-06",
            time: "17:00",
            location: "230 Wanless Ave, Toronto, ON M4N 1V6",
            coachName: "Brandon McKenzie",
            description: "Work on powerful and accurate groundstrokes.",
            itemsToBring: "Tennis racket, tennis balls, water bottle",
            icon: "ti5"
        ),
        Training(
            title: "Doubles Strategies",
            date: "2025-04-08",
            time: "18:30",
            location: "197 Avondale Ave, North York, ON M2N 2V4",
            coachName: "Ryan Caldwell",
            description: "Learn tactics for doubles matches.",
            itemsToBring: "Tennis racket, tennis balls, water bottle",
            icon: "ti6"
        ),
        Training(
            title: "Mental Toughness Training",
            date: "2025-04-10",
            time: "10:00",
            location: "230 Wanless Ave, Toronto, ON M4N 1V6",
            coachName: "Brandon McKenzie",
            description: "Develop mental resilience and focus.",
            itemsToBring: "Notebook, water bottle, towel",
            icon: "ti7"
        ),
        Training(
            title: "Youth Tennis Camp",
            date: "2025-04-12",
            time: "11:00",
            location: "197 Avondale Ave, North York, ON M2N 2V4",
            coachName: "Ryan Caldwell",
            description: "Training for young players aged 10-15.",
            itemsToBring: "Tennis racket, tennis balls, water bottle",
            icon: "ti8"
        ),
        Training(
            title: "Match Play Simulation",
            date: "2025-04-14",
            time: "19:00",
            location: "230 Wanless Ave, Toronto, ON M4N 1V6",
            coachName: "Brandon McKenzie",
            description: "Simulate real match conditions.",
            itemsToBring: "Tennis racket, tennis balls, water bottle",
            icon: "ti9"
        ),
        Training(
            title: "Recovery and Stretching Session",
            date: "2025-04-16",
            time: "09:30",
            location: "197 Avondale Ave, North York, ON M2N 2V4",
            coachName: "Ryan Caldwell",
            description: "Light session for recovery and flexibility.",
            itemsToBring: "Yoga mat, water bottle, towel",
            icon: "ti10"
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
            itemsToBring: "Skates, helmet, gloves, water bottle",
            icon: "hi1"
        ),
        Training(
            title: "Stickhandling Drills",
            date: "2025-03-20",
            time: "18:30",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Improve puck control and stickhandling.",
            itemsToBring: "Stick, gloves, helmet, water bottle",
            icon: "hi2"
        ),
        Training(
            title: "Shooting Accuracy",
            date: "2025-03-25",
            time: "19:00",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Focus on shooting accuracy and power.",
            itemsToBring: "Stick, gloves, helmet, water bottle",
            icon: "hi3"
        ),
        Training(
            title: "Defensive Positioning",
            date: "2025-03-30",
            time: "17:30",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Learn defensive strategies and positioning.",
            itemsToBring: "Stick, gloves, helmet, water bottle",
            icon: "hi4"
        ),
        Training(
            title: "Power Skating",
            date: "2025-04-05",
            time: "18:00",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Improve speed and agility on the ice.",
            itemsToBring: "Skates, helmet, gloves, water bottle",
            icon: "hi5"
        ),
        Training(
            title: "Goaltending Basics",
            date: "2025-04-10",
            time: "10:00",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Training for beginner goalies.",
            itemsToBring: "Goalie gear, water bottle",
            icon: "hi6"
        ),
        Training(
            title: "Team Play and Passing",
            date: "2025-04-15",
            time: "19:00",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Practice passing and team coordination.",
            itemsToBring: "Stick, gloves, helmet, water bottle",
            icon: "hi7"
        ),
        Training(
            title: "Youth Hockey Development",
            date: "2025-04-20",
            time: "11:00",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Training for young players aged 8-12.",
            itemsToBring: "Skates, stick, helmet, gloves, water bottle",
            icon: "hi8"
        ),
        Training(
            title: "Game Simulation",
            date: "2025-04-25",
            time: "18:30",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Simulate real game situations.",
            itemsToBring: "Full gear, water bottle",
            icon: "hi9"
        ),
        Training(
            title: "Recovery and Stretching",
            date: "2025-04-30",
            time: "09:00",
            location: "57 Carl Hall Rd, North York, ON M3K 2B6",
            coachName: "Kris Broer",
            description: "Light session for recovery and flexibility.",
            itemsToBring: "Yoga mat, water bottle, towel",
            icon: "hi10"
        )
    ]

    
    let volleyball: [Training] = [
        Training(
            title: "Basic Passing Techniques",
            date: "2025-03-28",
            time: "17:00",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Daniel MacLean",
            description: "Learn the fundamentals of passing and receiving.",
            itemsToBring: "Knee pads, water bottle, sports shoes",
            icon: "vi1"
        ),
        Training(
            title: "Serving Fundamentals",
            date: "2025-04-02",
            time: "18:30",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Sarah Hutchinson",
            description: "Focus on proper serving techniques.",
            itemsToBring: "Volleyball, water bottle, sports shoes",
            icon: "vi2"
        ),
        Training(
            title: "Setting and Tossing",
            date: "2025-04-07",
            time: "19:00",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Michael O'Connor",
            description: "Practice setting and tossing accuracy.",
            itemsToBring: "Volleyball, water bottle, sports shoes",
            icon: "vi3"
        ),
        Training(
            title: "Spiking and Attacking",
            date: "2025-04-12",
            time: "17:30",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Jennifer Campbell",
            description: "Improve spiking power and precision.",
            itemsToBring: "Volleyball, knee pads, water bottle",
            icon: "vi4"
        ),
        Training(
            title: "Blocking Strategies",
            date: "2025-04-17",
            time: "18:00",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Kevin Richardson",
            description: "Learn effective blocking techniques.",
            itemsToBring: "Volleyball, knee pads, water bottle",
            icon: "vi5"
        ),
        Training(
            title: "Defensive Drills",
            date: "2025-04-22",
            time: "10:00",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Emily Dawson",
            description: "Focus on defensive positioning and digs.",
            itemsToBring: "Volleyball, knee pads, water bottle",
            icon: "vi6"
        ),
        Training(
            title: "Team Coordination",
            date: "2025-04-27",
            time: "19:00",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Robert Sinclair",
            description: "Practice team plays and communication.",
            itemsToBring: "Volleyball, knee pads, water bottle",
            icon: "vi7"
        ),
        Training(
            title: "Youth Volleyball Camp",
            date: "2025-05-02",
            time: "11:00",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Jessica Morgan",
            description: "Training for young players aged 10-14.",
            itemsToBring: "Volleyball, knee pads, water bottle",
            icon: "vi8"
        ),
        Training(
            title: "Game Simulation",
            date: "2025-05-07",
            time: "18:30",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Christopher Bennett",
            description: "Simulate real match conditions.",
            itemsToBring: "Volleyball, knee pads, water bottle",
            icon: "vi9"
        ),
        Training(
            title: "Recovery and Stretching",
            date: "2025-05-12",
            time: "09:00",
            location: "75 Carl Hall Rd #3, North York, ON M3K 2B9",
            coachName: "Laura Thompson",
            description: "Light session for recovery and flexibility.",
            itemsToBring: "Yoga mat, water bottle, towel",
            icon: "vi10"
        )
    ]

}
