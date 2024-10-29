//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by João Marcelo Colombini Cardonha on 28/10/24.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
            
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor.gradient)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10.0)
                .foregroundColor(textColor)
    }
}

struct Prev: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Oi", textColor: .white, backgroundColor: .blue)
    }
}
