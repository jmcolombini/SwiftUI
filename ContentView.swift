//
//  ContentView.swift
//  copiapetlist
//
//  Created by João Marcelo Colombini Cardonha on 26/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Conteúdo principal da tela
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer().frame(height: 55)
                ScrollView(.horizontal, showsIndicators: false) {
                    Spacer().frame(height: 30)
                    HStack(spacing: 16) {
                        PetCardView(imageName: "Image", petName: "Mite")
                        PetCardView(imageName: "lia", petName: "Lia") // Repita para mais itens
                    }
                    .padding(.horizontal, 35)
                }
                .scrollTargetBehavior(.paging)
                
                Spacer()
                
            }
            
            // Toolbar com gradiente
            VStack {
                HStack {
                    Image(systemName: "line.3.horizontal")
                    Spacer()
                    Image(systemName: "plus")
                }
                .fontWeight(.semibold)
                .imageScale(.large)
                .foregroundStyle(.black)
                .padding()
                .background(
                    LinearGradient(
                    stops: [
                    Gradient.Stop(color: Color(red: 1, green: 0.91, blue: 0.49), location: 0.00),
                    Gradient.Stop(color: Color(red: 1, green: 0.72, blue: 0.29), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0, y: 0.51),
                    endPoint: UnitPoint(x: 1, y: 0.51)
                    )
                )
                .cornerRadius(10)
                .shadow(radius: 5)
                Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    ContentView()
}
