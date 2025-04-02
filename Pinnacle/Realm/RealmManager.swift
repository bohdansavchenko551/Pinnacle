//
//  RealmManager.swift
//  Pinnacle
//
//  Created by D K on 10.03.2025.
//

import SwiftUI
import RealmSwift

class RealmNote: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var note: String
}

class RealmReservation: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var type: String
    @Persisted var title: String
    @Persisted var date: String
    @Persisted var time: String
    @Persisted var location: String
}

class RealmImage: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var imageData: Data
}

class RealmManager {
    static let shared = RealmManager()
    private var realm: Realm

    private init(){realm = try! Realm()}
    
    @ObservedResults(RealmReservation.self) var reservations
    @ObservedResults(RealmNote.self) var notes
    @ObservedResults(RealmImage.self) var images
    
    func deleteFirstRealmImage() {
        let realm = try! Realm()
        
        if let firstImage = realm.objects(RealmImage.self).first {
            try! realm.write {
                realm.delete(firstImage)
            }
        }
    }
    
    func saveImage(image: UIImage) {
        deleteFirstRealmImage()
        
        let imageToSave = RealmImage()
        if let data = image.jpegData(compressionQuality: 1) {
            imageToSave.imageData = data
        }
        
        do {
            try realm.write {
                realm.add(imageToSave)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteNote(note: RealmNote) {
        do {
            try realm.write {
                realm.delete(note)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveNote(title: String, noteText: String) {
        let note = RealmNote()
        note.title = title
        note.note = noteText
        
        do {
            try realm.write {
                realm.add(note)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveReservation(training: Training, type: String) {
        let reservationToSave = RealmReservation()
        reservationToSave.type = type
        reservationToSave.title = training.title
        reservationToSave.time = training.time
        reservationToSave.date = training.date
        reservationToSave.time = training.time
        reservationToSave.location = training.location
        
        do {
            try realm.write {
                realm.add(reservationToSave)
            }
        } catch {
            print(error.localizedDescription)
        }
      
    }
    
    func noteMOCK() -> RealmNote {
        let note = RealmNote()
        note.title = "Loram Ipsum"
        note.note = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
"""
        
        return note
    }
    
    func updateNote(realmNote: RealmNote, newTitle: String, newNote: String) {
        do {
            
            try realm.write {
                realmNote.title = newTitle
                realmNote.note = newNote
            }
        } catch {
            print("\(error)")
        }
    }
}
