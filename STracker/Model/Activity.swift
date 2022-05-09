//
//  File.swift
//  STracker
//
//  Created by José Cisneros on 27/04/22.
//

import Foundation
import RealmSwift

enum ActivityCategory: String, PersistableEnum {
    case running
    case cycling
    case swimming
    case pilates
    case gymnastics
    case stepper
    case tennis
    case workout
}

class Activity: Object {
    @Persisted var name: String
    @Persisted var actDescription: String
    @Persisted var duration: String?
    @Persisted var distance: String?
    @Persisted var activityCategory: ActivityCategory
    @Persisted var activityDate: Date
    
    convenience init(name: String, description: String, duration: String? = nil, distance: String? = nil, category: ActivityCategory, activityDate: Date) {
        self.init()
        self.name = name
        self.actDescription = description
        self.duration = duration
        self.distance = distance
        self.activityCategory = category
        self.activityDate = activityDate
    }
}
