//
//  CustomTabBar.swift
//  PetTelas
//
//  Created by found on 31/01/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tabs
    var body: some View {
        VStack(spacing: 10) {
            Divider()
            HStack {
                Button {
                    selectedTab = .pets
                } label: {
                    VStack(spacing: 2) {
                        Image(systemName: "pawprint.fill")
                            .foregroundStyle(selectedTab == .pets ? .yellow : Color(.systemGray2))
                        Text("Meus Bichos")
                            .font(.system(size: 10))
                            .foregroundStyle(selectedTab == .pets ? .black : Color(.systemGray2))
                    }
                    .padding(.leading, 70)
                }
                Spacer()
                Button {
                    selectedTab = .ajustes
                } label: {
                    VStack(spacing: 2) {
                        Image(systemName: "gearshape")
                            .foregroundStyle(selectedTab == .ajustes ? .yellow : Color(.systemGray2))
                        Text("Ajustes")
                            .font(.system(size: 10))
                            .foregroundStyle(selectedTab == .ajustes ? .black : Color(.systemGray2))
                    }
                    .padding(.trailing, 70)
                }
                
            }
        }
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.pets))
}


//.overlay(alignment: .bottom) {
//    VStack(spacing: 10) {
//        Divider()
//        HStack {
//            VStack(spacing: 2) {
//                Image(systemName: "pawprint.fill")
//                    .foregroundStyle(.yellow)
//                Text("Meus Bichos")
//                    .font(.system(size: 10))
//            }
//            .padding(.leading, 70)
//            Spacer()
//            VStack(spacing: 2) {
//                Image(systemName: "gearshape")
//                Text("Ajustes")
//                    .font(.system(size: 10))
//            }
//            .foregroundStyle(Color(.systemGray2))
//            .padding(.trailing, 70)
//        }
//    }
//}
