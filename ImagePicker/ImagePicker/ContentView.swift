//
//  ContentView.swift
//  ImagePicker
//
//  Created by Mantosh Kumar on 15/10/24.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    
    @State private var image: Image?
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Spacer()
                
                PhotosPicker(selection: $selectedItem) {
                    if let image {
                        image.resizable().scaledToFit()
                    } else {
                        ContentUnavailableView("No image", systemImage: "photo.badge.plus", description: Text("Tap to pic image"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, pickImage)
                
                
                HStack {
                    Text("Pick images")
                    Button("Tap to pick image", action: pickImage)
                }
            }
            .navigationTitle("Image Picker")
        }
    }
    
    func pickImage() {
        
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else  {
                return
            }
            guard let inputImage = UIImage(data: imageData) else { return }
        }
        
    }
}

#Preview {
    ContentView()
}
