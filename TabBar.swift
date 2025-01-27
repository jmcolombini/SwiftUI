//
//  TabBar.swift
//  copiapetlist
//
//  Created by João Marcelo Colombini Cardonha on 26/01/25.
//

import SwiftUI

//struct TabBar: View {
//    var body: some View {
//        TabView {
//            ContentView()
//                .tabItem {
//                    Image(systemName: "pawprint")
//                }
//            Text("Profile")
//                .tabItem {
//                    Image(systemName: "person")
//                }
//        }
//
//    }
//}

struct TabBar: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            ContentView()
                .tabItem {
                    Image(systemName: "pawprint")
                        .resizable()
                        .scaledToFit()
                        .frame(width: selectedTab == 0 ? 50 : 24, height: selectedTab == 0 ? 50 : 24) // Aumenta o ícone se selecionado
                    Text("Home")
                }
                .tag(0)

            SettingsView()
                .tabItem {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .frame(width: selectedTab == 1 ? 50 : 24, height: selectedTab == 1 ? 50 : 24) // Aumenta o ícone se selecionado
                    Text("Profile")
                }
                .tag(1)
        }
        .accentColor(Color(red: 1, green: 0.65, blue: 0))
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("Home View")
                .navigationTitle("Home")
        }
    }
}

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Text("Settings View")
                .navigationTitle("Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    TabBar()
}
