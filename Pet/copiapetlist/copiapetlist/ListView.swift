//
//  ContentView.swift
//  copiapetlist
//
//  Created by João Marcelo Colombini Cardonha on 28/12/24.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @Environment(\.modelContext) var modelContext

    @Query var pets: [Pet]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 100) {
                if pets.count > 0 {
                    ScrollView {
                        ForEach(pets) { pet in
                            PetView(name: pet.name,
                                    image: UIImage(data: pet.image)!,
                                    descript: pet.descript,
                                    sexo: pet.sexo,
                                    birthdate: pet.birthdate)
                            .contextMenu {
                                Button(role: .destructive){
                                    withAnimation {
                                        modelContext.delete(pet)
                                    }
                                } label: {
                                    Label("Deletar pet", systemImage: "trash")
                                }
                            }
                        }
                    }
                    
                } else if pets.count == 0 {
                    ScrollView {
                        Spacer().frame(height: 50)
                        Text("Você não adicionou um pet ainda. Adicione um para vê-lo!")
                            .font(.system(size: 32))
                            .foregroundStyle(.gray)
                            .frame(width: 320)
                            .multilineTextAlignment(.center)
                        
                    }
                }
            }
            .navigationTitle("Meus Pets 🐾")
            .navigationBarItems(leading: Button("Mite", action: randomPet),trailing: NavigationLink("Adicionar", destination: AddPetView()))
        }
    }
    func randomPet() {
        let pet = Pet(name: "Mitinho", image: .image, descript: "Fugitivo.", sexo: 2, birthdate: .distantPast)
        modelContext.insert(pet)
    }
}

#Preview {
    ListView().modelContainer(for: Pet.self)
}
