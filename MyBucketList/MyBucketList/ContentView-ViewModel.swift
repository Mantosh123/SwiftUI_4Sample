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
        
        private (set) var locations: [Location]
        var selectedPlace: Location?
        
        let savePath = URL.documentsDirectory.appending(path: "SavePlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options:[.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data")
            }
        }
        
        
        func addLoction(at point: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
    }
}
