//
//  SwiftUIView.swift
//  copiapetlist
//
//  Created by João Marcelo Colombini Cardonha on 26/01/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer().frame(height: 30)
                VStack(spacing: 16) {
                    PetCardView(imageName: "Image", petName: "Flecha")
                    PetCardView(imageName: "Image", petName: "Outro Pet") // Repita para mais itens
                }
                .padding(.horizontal, 40)
            }
            
            // Tab Bar na parte inferior
            
            
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        PetView(name: "Mite", image: .image, descript: "Mite", sexo: 1, birthdate: .now)
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .padding(.bottom)
                    }
                }
            }
            .toolbarBackground(Color.yellow, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
            
        }
    }
}

struct PetCardView: View {
    var imageName: String
    var petName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 330, height: 500)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .overlay(
                Text(petName)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                    .padding(.bottom, 15),
                alignment: .bottomLeading
            )
            .shadow(radius: 5)
    }
}

#Preview {
    SwiftUIView()
}
