//
//  Pet.swift
//  PetTelas
//
//  Created by found on 29/01/25.
//

import Foundation
import PhotosUI

class Pet: Identifiable {
    let id = UUID()
    let name: String
    let imageURL: Data
    
    init(name: String, imageURL: UIImage) {
        self.name = name
        self.imageURL = imageURL.pngData()!
    }
}
