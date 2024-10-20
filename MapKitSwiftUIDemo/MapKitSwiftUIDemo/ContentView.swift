//
//  ContentView.swift
//  MapKitSwiftUIDemo
//
//  Created by Mantosh Kumar on 19/10/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    
    
    var body: some View {
        Map()
            .mapStyle(.hybrid(elevation: .realistic))
    }
}

#Preview {
    ContentView()
}
