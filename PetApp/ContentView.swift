//
//  ContentView.swift
//  copiapetlist
//
//  Created by João Marcelo Colombini Cardonha on 26/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
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
                        .padding(.horizontal, 30)
                    }
                    .scrollTargetBehavior(.paging)
                    
                    Spacer()
                    
                }
                
                // Toolbar com gradiente
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink {
                            Text("Adicionar Pet")
                        } label: {
                            Text("+")
                        }
                        
                    }
                    .padding(.bottom,8)
                    .padding(.horizontal)
                    .accentColor(.secondary)
                    .font(.system(size: 34, weight: .light))
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 1, green: 0.91, blue: 0.49), location: 0.00),
                                Gradient.Stop(color: Color(red: 1, green: 0.72, blue: 0.29), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0, y: 0.51),
                            endPoint: UnitPoint(x: 1, y: 0.51)
                        )
                        .ignoresSafeArea()
                    )
                    Spacer()
                }
            }
        }
    }
}
struct PetCardView: View {
    var imageName: String
    var petName: String
    
    var body: some View {
        VStack(spacing: 15) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 330, height: 500)
                .clipShape(RoundedRectangle(cornerRadius: 60))
            
            HStack {
                Text(petName)
                    .font(.system(size: 36, weight: .medium))
                    .padding(.horizontal)
                Spacer()
                Image(systemName: "pencil.line")
                    .font(.system(size: 24, weight: .medium))
                    .padding(.horizontal)
            }
            .padding(.vertical,8)
            .frame(width: 330)
            .fontWeight(.semibold)
            .imageScale(.large)
            .foregroundStyle(.white)
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 1, green: 0.91, blue: 0.49), location: 0.00),
                        Gradient.Stop(color: Color(red: 1, green: 0.72, blue: 0.29), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 1, y: 0.51),
                    endPoint: UnitPoint(x: 0, y: 0.51)
                )
            )
            .cornerRadius(30)
            .shadow(color: .black.opacity(0.1), radius: 2.9, x: 0, y: 4)
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
    }
}
#Preview {
    PetCardView(imageName: "Image", petName: "Mite")
}
#Preview {
    ContentView()
}

var tabItems = ["Pet", "Profile"]

