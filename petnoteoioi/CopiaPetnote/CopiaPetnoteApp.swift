//
//  CopiaPetnoteApp.swift
//  CopiaPetnote
//
//  Created by found on 25/02/25.
//

import SwiftUI

@main
struct CopiaPetnoteApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView(show: .constant(true))
                .modelContainer(for: Pet.self)
        }
    }
}
