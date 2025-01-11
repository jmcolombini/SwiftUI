//
//  copiapetlistApp.swift
//  copiapetlist
//
//  Created by João Marcelo Colombini Cardonha on 28/12/24.
//

import SwiftUI
import SwiftData

@main
struct copiapetlistApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
        }.modelContainer(for: Pet.self)
    }
}
