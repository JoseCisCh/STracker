//
//  File.swift
//  STracker
//
//  Created by José Cisneros on 27/04/22.
//

import Foundation
import RealmSwift

class Activity: Object {
    @Persisted var name: String
    @Persisted var actDescription: String
    @Persisted var duration: String?
    @Persisted var distance: Double?
    
    convenience init(name: String, description: String, duration: String? = nil, distance: Double? = nil) {
        self.init()
        self.name = name
        self.actDescription = description
        self.duration = duration
        self.distance = distance
    }
}
