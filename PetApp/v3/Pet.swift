//
//  Pet.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 29/01/25.
//

import Foundation
import PhotosUI

class Pet: Identifiable {
    let id = UUID()
    let name: String
    let imageURL: Data
    var isSelected: Bool
    
    init(name: String, imageURL: UIImage, isSelected: Bool) {
        self.name = name
        self.imageURL = imageURL.pngData()!
        self.isSelected = isSelected
    }
}
