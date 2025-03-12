//
//  RealmManager.swift
//  Pinnacle
//
//  Created by D K on 10.03.2025.
//

import SwiftUI
import RealmSwift

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
}
