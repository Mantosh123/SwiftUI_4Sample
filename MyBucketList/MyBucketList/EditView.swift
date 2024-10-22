//
//  EditView.swift
//  MyBucketList
//
//  Created by Mantosh Kumar on 22/10/24.
//

import Foundation
import SwiftUI

struct EditView: View {
    
    @Environment(\.dismiss) var dismiss
    var location: Location
    @State private var name: String
    @State private var discription: String
    var onSave: (Location) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Description", text: $discription)
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("save") {
                    
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = discription
                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        _name = State(initialValue: location.name)
        _discription = State(initialValue: location.description)
    }
    
}

#Preview {
    EditView(location: .example ) { _ in }
}
