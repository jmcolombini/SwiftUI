//
//  AddPetView.swift
//  copiapetlist
//
//  Created by João Marcelo Colombini Cardonha on 28/12/24.
//

import SwiftUI
import SwiftData
import PhotosUI

@MainActor
final class PhotoPickerViewModel: ObservableObject {
    @Published private(set) var selectedImage: UIImage? = nil
    @Published var imageSelection: PhotosPickerItem?  = nil {
        didSet {
            setImage(from: imageSelection)        }
    }
    
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else { return }
        
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                    return
                }
            }
        }
    }
}
struct AddPetView: View {
    @StateObject private var photoViewModel = PhotoPickerViewModel()
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State var nameText: String = ""
    @State var descriptionText: String = ""
    @State var sexo: Int = 1
    @State var birthdate: Date = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Detalhes do Pet")) {
                    TextField("Nome", text: $nameText)
                    TextField("Descrição", text: $descriptionText, axis: .vertical)
                    
                    Picker("Sexo", selection: $sexo) {
                        Text("Não informar").tag(1)
                        Text("Macho").tag(2)
                        Text("Fêmea").tag(3)
                    }
                    .pickerStyle(.automatic)
                    
                    DatePicker("Data de nascimento", selection: $birthdate, displayedComponents: .date)
                }
                Section(header: Text("FOTO do pet")) {
                    VStack {
                        if let selectedImage = photoViewModel.selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 200)
                                .cornerRadius(10)
                                .padding(.top)
                        } else {
                            Image(systemName: "photo.badge.plus.fill")
                                .resizable()
                                .symbolRenderingMode(.hierarchical)
                                .foregroundStyle(.blue)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 180, height: 150)
                                .cornerRadius(10)
                                .padding(.top)
                        }
                            
                        PhotosPicker(selection: $photoViewModel.imageSelection) {
                            Text("Escolher imagem")
                                .font(.title2)
                                .padding()
                        }
                    }
                    .padding(.horizontal,60)
                }
            }
            .navigationTitle("Adicionar Pet")
            .navigationBarTitleDisplayMode(.large)
            .formStyle(.grouped)
            
            Button(action: saveButtonPressed, label: {
                Text("Salvar")
                    .font(.system(size: 35, weight: .medium))
                    .foregroundStyle(.blue)
                    .frame(width: 200,height: 10)
                    .padding(.top, 30)
            })
        Spacer()
        }
        
    }
    func saveButtonPressed() {
        if nameText.count > 1 && descriptionText.count > 3 {
            if let selectedImage = photoViewModel.selectedImage {
                let pet = Pet(
                    name: nameText,
                    image: selectedImage,
                    descript: descriptionText,
                    sexo: sexo,
                    birthdate: birthdate
                )
                modelContext.insert(pet)
                nameText = ""
                descriptionText = ""
                dismiss()
            }
        }
    }
}

#Preview {
    AddPetView().modelContainer(for: Pet.self)
}

