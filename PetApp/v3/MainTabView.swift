//
//  MainTabView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 29/01/25.
//

import SwiftUI

struct MainTabView: View {
    @Binding var show: Bool
    var body: some View {
        TabView {
            // Primeira aba
            SelectedPetView()
                .tabItem {
                    Label("Meus bichos", systemImage:  "pawprint")
                }
            
            // Segunda aba
            AccountView()
                .tabItem {
                    Label("Ajustes", systemImage:  "gearshape")
                }
        }
        .accentColor(.accent)  // Cor dos ícones quando selecionados
    }
}

#Preview {
    MainTabView(show: .constant(true))
}

struct AccountView: View {
    var body: some View {
        NavigationView {
            Text("Account View")
                .navigationTitle("Settings")
        }
    }
}
