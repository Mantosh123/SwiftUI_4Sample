//
//  ContentView.swift
//  ImagePicker
//
//  Created by Mantosh Kumar on 15/10/24.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    
    @State private var selectedImage = [Image]()
    @State private var pickerItem = [PhotosPickerItem]()
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker("Select a image", selection: $pickerItem, matching: .images)
                ScrollView {
                    ForEach(0..<selectedImage.count, id: \.self) { i in
                        selectedImage[i]
                            .resizable()
                            .scaledToFit()
                            
                    } 
                }
            }.onChange(of: pickerItem) { oldValue, newValue in
                Task {
                    selectedImage.removeAll()
                    
                    for item in pickerItem {
                        if let loadedImage = try await item.loadTransferable(type: Image.self) {
                            selectedImage.append(loadedImage)
                        }
                    }
                }
            }
            .navigationTitle("Image Picker")
        }
    }
}

#Preview {
    ContentView()
}
