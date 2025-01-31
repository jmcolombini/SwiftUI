//
//  MyPetView.swift
//  PetTelas
//
//  Created by found on 28/01/25.
//

import SwiftUI

struct MyPetView: View {
    var pets = [
        Pet(name: "Mite", imageURL: .lia, isSelected: true),
        Pet(name: "Lia", imageURL: .lia, isSelected: false),
        Pet(name: "Fred", imageURL: .lia, isSelected: false),
        Pet(name: "Flecha", imageURL: .lia, isSelected: false)
    ]
    @State var selectedPet: Pet
    
    var body: some View {
        NavigationView {
            ZStack {
                // Conteúdo principal da tela
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ScrollView {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(pets) { pet in
                                    PetCardView(imageName: UIImage(data: pet.imageURL)!, petName: pet.name)
                                }
                            }
                            .padding(.horizontal, 30)
                            Spacer()
                        }
                        .padding(.top)
                        .scrollTargetBehavior(.paging)
                    }
                    
                    
                }
                .navigationBarItems(
                    trailing:
                        NavigationLink {
                            
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(.black)
                        })
                .navigationTitle("Meus Bichos")
                
                // Toolbar com gradiente
            }
        }
    }
}

struct PetCardView: View {
    var imageName: UIImage
    var petName: String
    
    var body: some View {
        VStack(spacing: 15) {
            Image(uiImage: imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 330, height: 450)
                .clipShape(RoundedRectangle(cornerRadius: 60))
        }
        .overlay {
            VStack {
                Spacer()
                HStack {
                    Text(petName)
                    Spacer()
                }
            }
            .padding(30)
            .font(.largeTitle)
            .foregroundStyle(.white)
            .fontWeight(.medium)
        }
    }
}

