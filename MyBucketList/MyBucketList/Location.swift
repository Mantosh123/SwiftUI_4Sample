//
//  Location.swift
//  MyBucketList
//
//  Created by Mantosh Kumar on 20/10/24.
//

import Foundation
import MapKit

struct Location: Codable, Equatable, Identifiable {
    
    var id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    
    var cordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = Location(id: UUID(), name: "next visit", description: "This is awesome Place", latitude: 12, longitude: 77)
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
