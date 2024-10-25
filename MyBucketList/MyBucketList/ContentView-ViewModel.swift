//
//  ContentView-ViewModel.swift
//  MyBucketList
//
//  Created by Mantosh Kumar on 25/10/24.
//

import Foundation
import CoreLocation
import MapKit

extension ContentView {
    @Observable
    class ViewModel {
        
        var locations = [Location]()
        var selectedPlace: Location?
        
        func addLoction(at point: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
        }
        
        func update(location: Location) {
            guard let selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
        }
    }
}
