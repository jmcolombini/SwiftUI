//
//  TabView.swift
//  PetTelas
//
//  Created by found on 24/01/25.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTab: Tabs = .pets
    @Binding var show: Bool
    var body: some View {
        if selectedTab == .pets {
            SelectedPetView()
        } else if selectedTab == .ajustes {
            SettingsView()
        }
        CustomTabBar(selectedTab: $selectedTab)
    }
}

#Preview {
    MainTabView(show: .constant(true))
        .environmentObject(PetViewModel())
}

enum Tabs: Int {
    case pets = 0
    case ajustes = 1
}

struct SettingsView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Settings View")
            Spacer()
        }
    }
}

//TabView {
//    // Primeira aba
//    SelectedPetView()
//        .tabItem {
//            Label("Meus bichos", systemImage:  "pawprint")
//        }
//    
//    // Segunda aba
//    AccountView()
//        .tabItem {
//            Label("Ajustes", systemImage:  "gearshape")
//        }
//}
//.accentColor(.accent)  // Cor dos ícones quando selecionados
