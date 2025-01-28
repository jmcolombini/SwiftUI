//
//  MyPetView.swift
//  PetTelas
//
//  Created by found on 28/01/25.
//

import SwiftUI

struct MyPetView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Conteúdo principal da tela
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ScrollView {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                PetCardView(imageName: "mite", petName: "Mite")
                                PetCardView(imageName: "mite", petName: "Lia") 
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

#Preview {
    MyPetView()
}

struct PetCardView: View {
    var imageName: String
    var petName: String
    
    var body: some View {
        VStack(spacing: 15) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 330, height: 450)
                .clipShape(RoundedRectangle(cornerRadius: 60))
            
            //            .overlay(
            //                Text(petName)
            //                    .font(.largeTitle)
            //                    .fontWeight(.medium)
            //                    .foregroundColor(.white)
            //                    .padding(.leading, 20)
            //                    .padding(.bottom, 15),
            //                alignment: .bottomLeading
            //            )
            //            .shadow(radius: 5)
        }
        .overlay {
            VStack {
                Spacer()
                HStack {
                    Text("Brenno")
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

#Preview {
    PetCardView(imageName: "mite", petName: "Mite")
}
