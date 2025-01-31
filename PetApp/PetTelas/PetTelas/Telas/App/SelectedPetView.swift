//
//  SelectedPetView.swift
//  PetTelas
//
//  Created by found on 30/01/25.
//

import SwiftUI

enum Picker {
    case agenda
    case saude
    case compras
    case passeios
    case none
}

struct SelectedPetView: View {
    @EnvironmentObject var viewModel: PetViewModel    
    @State var showSheet = false
    @State private var showAddAnimalView = false
    @State var selectedPet = 0
    @State var selectedPicker: Picker = .none
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 15) {
                    Image(uiImage: UIImage(data: viewModel.pets[selectedPet].imageURL)!)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaledToFill()
                        .clipShape(Circle())
                    
                    HStack {
                        Text(viewModel.pets[selectedPet].name)
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
                        SheetView(showAddPetView: $showAddAnimalView, showSheet: $showSheet, pets: $viewModel.pets)
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
                    Spacer().frame(height: 40)
                    
                    VStack(spacing: 20) {
                        CollapsedPickerView(name: "Agenda", icon: "calendar.circle.fill", color: Color(red: 0.87, green: 0.38, blue: 0.39), height: selectedPicker == .agenda ? 300 : 100)
                            .onTapGesture {
                                withAnimation {
                                    selectedPicker = .agenda
                                }
                            }
                        CollapsedPickerView(name: "Saúde", icon: "heart.circle", color: Color(red: 0.37, green: 0.82, blue: 0.8), height: selectedPicker == .saude ? 300 : 100)
                            .onTapGesture {
                                withAnimation {
                                    selectedPicker = .saude
                                }
                            }
                        
                        CollapsedPickerView(name: "Compras", icon: "cart.fill", color: Color(red: 0.17, green: 0.52, blue: 0.82), height: selectedPicker == .compras ? 300 : 100)
                            .onTapGesture {
                                withAnimation {
                                    selectedPicker = .compras
                                }
                            }
                        CollapsedPickerView(name: "Passeios", icon: "point.bottomleft.forward.to.arrow.triangle.uturn.scurvepath.fill", color: Color(red: 1, green: 0.65, blue: 0.2), height: selectedPicker == .passeios ? 300 : 100)
                            .onTapGesture {
                                withAnimation {
                                    selectedPicker = .passeios
                                }
                            }
                    }
                    
                }
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
        return addButtonHeight + baseHeight + itemHeight * CGFloat(viewModel.pets.count)
        }
}

#Preview {
    SelectedPetView()
        .environmentObject(PetViewModel())
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
                        HStack(spacing: 15) {
                            Image(uiImage: UIImage(data: pets[index].imageURL)!)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .scaledToFill()
                                .clipShape(Circle())
                            
                            Text(pets[index].name)
                                .font(.system(size: 20, weight: .semibold))
                            Spacer()
                            
                            Image(systemName: pets[index].isSelected ? "checkmark.circle.fill" : "")
                                .resizable()
                                .fontWeight(pets[index].isSelected ? .regular :  .ultraLight)
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.orange)
                                
                        }
                        .onTapGesture {
                            selectPet(index)
                        }
                        .padding(.horizontal)
                        
                    }
                    
                    Button {
                        let pet = Pet(name: "Lia", imageURL: .lia, isSelected: false)
                        pets.append(pet)
                        showSheet = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            showAddPetView = true
                        }
                    } label: {
                        HStack(spacing: 15) {
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
        if index > 0 {
            let item = pets.remove(at: index)  // Remove o item da posição 2 (30)
            withAnimation(.snappy) {
                pets.insert(item, at: 0)
            }
        }
    }
}
