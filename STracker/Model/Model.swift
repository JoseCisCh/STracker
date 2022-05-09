//
//  Model.swift
//  STracker
//
//  Created by José Cisneros on 06/05/22.
//

import Foundation
import RealmSwift

struct Model {
    
    let realm = try! Realm()
    var activities: Results<Activity>?
    
    init() {
        getAllActivities()
    }
    
    static var shared = Model()
    
    mutating func getAllActivities() {
        let activitiesNotSorted = realm.objects(Activity.self)
        self.activities = activitiesNotSorted.sorted(byKeyPath: "activityDate", ascending: false)
    }
    
    mutating func addActivity(newActivity: Activity) {
        do {
            try realm.write {
                realm.add(newActivity)
            }
        } catch {
            print(error)
        }
    }
    
    func deleteActivity(activityToDelete: Activity) {
        do {
            try realm.write {
                realm.delete(activityToDelete)
            }
        } catch {
            print(error)
        }
    }
    
    
}
