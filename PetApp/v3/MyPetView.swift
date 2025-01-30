//
//  MyPetView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 29/01/25.
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

struct SelectedPetView: View {
    @State var pets = [
        Pet(name: "Mite", imageURL: .lia, isSelected: false),
        Pet(name: "Lia", imageURL: .lia, isSelected: false),
        Pet(name: "Fred", imageURL: .lia, isSelected: false),
        Pet(name: "Flecha", imageURL: .lia, isSelected: false)
    ]
    
    @State var showSheet = false
    @State private var showAddAnimalView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 15) {
                    Image(uiImage: .lia)
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
                        SheetView(showAddPetView: $showAddAnimalView, showSheet: $showSheet, pets: $pets)
                            .presentationDetents([.height(sheetHeight())])
                            .presentationDragIndicator(.visible)

                    }
                    .navigationDestination(isPresented: $showAddAnimalView) {
                        AddPetView()
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
                        AddPetView()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.black)
                    })
        }
    }
    private func sheetHeight() -> CGFloat {
        let addButtonHeight: CGFloat = 40
        let baseHeight: CGFloat = 30  // Altura mínima
        let itemHeight: CGFloat = 65   // Altura estimada por item
        return addButtonHeight + baseHeight + itemHeight * CGFloat(pets.count)
        }
}

#Preview {
    SelectedPetView()
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var showAddPetView: Bool
    @Binding var showSheet: Bool
    @Binding var pets: [Pet]

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 10) {
                VStack(spacing: 20) {
                    ForEach(pets.indices) { index in
                        HStack {
                            Image(uiImage: UIImage(data: pets[index].imageURL)!)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .scaledToFill()
                                .clipShape(Circle())
                            
                            Text(pets[index].name)
                                .font(.system(size: 20, weight: .semibold))
                            Spacer()
                            
                            Image(systemName: pets[index].isSelected ? "checkmark.circle.fill" : "circle")
                                .resizable()
                                .fontWeight(pets[index].isSelected ? .regular :  .ultraLight)
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.orange)
                                .onTapGesture {
                                    selectPet(index)
                                }
                        }
                        .padding(.horizontal)
                        
                    }
                    
                    Button {
                        showSheet = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            showAddPetView = true
                        }
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .fontWeight(.ultraLight)
                                .foregroundStyle(.accent)
                            
                            Text("Adicione outro animal")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(.black)
                            Spacer()
                        }
                        .padding(.leading)
                    }
                }
            }
            .padding(.top)
        }
    }
    
    private func selectPet(_ index: Int) {
            // Cria uma cópia do array de pets com o pet selecionado
            pets = pets.map { pet in
                var petCopy = pet
                petCopy.isSelected = false // Desmarca todos
                return petCopy
            }
            // Marca o pet selecionado
            pets[index].isSelected = true
        }
}


