//
//  PetStatusComponent.swift
//  PetTelas
//
//  Created by found on 31/01/25.
//

import SwiftUI

struct CollapsedPickerView: View {
    let name: String
    let icon: String
    let color: Color
    var height: Int
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text(name)
                .font(.system(size: 32))
                .padding(15)
    
            Spacer()
            
            Image(systemName: icon)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(color)
                .padding(20)
            
        }
        .frame(width: .infinity, height: CGFloat(height), alignment: .topLeading)
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        .cornerRadius(30)
        .padding(.horizontal, 25)
    }
}

#Preview {
    CollapsedPickerView(name: "Agenda", icon: "calendar.circle.fill", color: Color(red: 0.87, green: 0.38, blue: 0.39), height: 100)
}
