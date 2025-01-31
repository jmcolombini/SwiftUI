//
//  PetTelasApp.swift
//  PetTelas
//
//  Created by found on 21/01/25.
//

import SwiftUI

@main
struct PetTelasApp: App {
    @StateObject var viewModel: PetViewModel = PetViewModel()
    var body: some Scene {
        WindowGroup {
            EnterView()
        }
        .environmentObject(viewModel)
    }
}
