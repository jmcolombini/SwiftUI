//
//  Pet.swift
//  copiapetlist
//
//  Created by João Marcelo Colombini Cardonha on 28/12/24.
//

import Foundation
import PhotosUI
import SwiftData

@Model
class Pet {
    var name: String
    var image: Data
    var descript: String
    var sexo: Int
    var birthdate: Date
    
    init(name: String, image: UIImage, descript: String, sexo: Int = 1, birthdate: Date = .now){
        self.name = name
        self.image = image.pngData()!
        self.descript = descript
        self.sexo = sexo
        self.birthdate = birthdate
    }
}


