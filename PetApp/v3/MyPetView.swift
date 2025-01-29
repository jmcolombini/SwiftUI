//
//  MyPetView.swift
//  PetTelas
//
//  Created by found on 28/01/25.
//

import SwiftUI

struct MyPetView: View {
    var pets = [
        Pet(name: "Mite", imageURL: .mite),
        Pet(name: "Lia", imageURL: .mite),
        Pet(name: "Lia", imageURL: .mite),
        Pet(name: "Fred", imageURL: .mite)
    ]
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

#Preview {
    MyPetView()
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

struct SelectedPetView: View {
    var pets = [
        Pet(name: "Mite", imageURL: .mite),
        Pet(name: "Lia", imageURL: .mite),
        Pet(name: "Lia", imageURL: .mite),
        Pet(name: "Fred", imageURL: .mite)
    ]
    @State var showSheet = false
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 15) {
                    Image(uiImage: .mite)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaledToFill()
                        .clipShape(Circle())
                    
                    HStack {
                        Text("Mite")
                            .font(.system(size: 36, weight: .semibold))
                        Button {
                            showSheet.toggle()
                        } label: {
                            Image(systemName: "chevron.down")
                                .fontWeight(.medium)
                                .foregroundStyle(.black)
                        }
                            
                        
                    }
                    .sheet(isPresented: $showSheet) {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Selecione o pet")
                                .font(.headline)
                                .padding(.leading)
                                .padding(.top)
                            
                            Divider()
                            
                            HStack {
                                Image(uiImage: .mite)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .scaledToFill()
                                    .clipShape(Circle())
                                
                                Text("Mite")
                                    .font(.system(size: 20, weight: .semibold))
                                Spacer()
                            }
                            .padding(.leading)
                            
                            .presentationDetents([.height(100)])
                        }
                        
                    }
                    Spacer()
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, -15)
                ScrollView {
                    //Continuar vstack daqui
                    VStack(spacing: 30) {
                        HStack(spacing: 30) {
                            Rectangle()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                            Rectangle()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                        HStack(spacing: 30) {
                            Rectangle()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                            Rectangle()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                    }
                    
                    
                }
                .padding(.top, 60)
            }
            .navigationBarItems(
                trailing:
                    NavigationLink {
                        Text("Add a pet view")
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.black)
                    })
        }
    }
}

#Preview {
    PetCardView(imageName: .mite, petName: "Mite")
}
#Preview {
    SelectedPetView()
}
