//
//  PetView.swift
//  copiapetlist
//
//  Created by João Marcelo Colombini Cardonha on 28/12/24.
//

import SwiftUI

struct PetView: View {
    @State private var isHearted = false
    @State private var showSheet = false
    let name: String
    let image: UIImage
    let descript: String
    let sexo: Int
    let birthdate: Date
    var body: some View {
        VStack {
            Spacer()
            
            Text(name)
                .font(.system(size: 26, weight: .medium, design: .default))
                .foregroundStyle(.black)
            
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 380, height: 380)
                .cornerRadius(10)
            
            Spacer().frame(height: 10)
            
            HStack(spacing: 15){
                Image(systemName: isHearted ? "heart.fill" : "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(isHearted ? .red : .black, isHearted ? .red : .white)
                    .scaleEffect(isHearted ? 1.1 : 1.0)
                    .frame(width: 30,height: 30)
                    .padding(.leading,15)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.9, blendDuration: 0)) {
                            isHearted.toggle()
                        }
                    }
                Image(systemName: "info.circle")
                    .resizable()
                    .frame(width: 30,height: 30)
                    .scaledToFit()
                    .onTapGesture {
                        showSheet.toggle()
                    }
                    
                Spacer()
            }.padding(.bottom)
        }
        .sheet(isPresented: $showSheet, content: {
            PetDetailView(imageName: image, petName: name, descript: descript, sexo: sexo, birthdate: birthdate)
        })
    }
}
struct PetDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var imageName: UIImage
    var petName: String
    var descript: String
    var sexo: Int
    var birthdate: Date
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                        .background(Color(.mercury))
                        .cornerRadius(100)
                }
            }
            .padding()
            
            Spacer().frame(height: 50)
            
            
            Image(uiImage: imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .cornerRadius(1000)
                
            
            
            Text(petName)
                .font(.system(size: 35))
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                .padding(.top, 12)
            VStack(alignment: .leading) {
                Text(descript)
                    .font(.system(size: 25, weight: .regular))
                    .padding(.vertical, 15)

            
                Text("Sexo: \(identifySex(sexo))")
                    .font(.system(size: 20, weight: .regular))
                Text("Data de aniversário: \(birthdate.formatted(date: .numeric, time: .omitted))")
                    .font(.system(size: 20, weight: .regular))
            }.padding()
            
            Spacer()
        }
    }
    func identifySex(_ sexo: Int) -> String {
        if let petSex = PetSex(rawValue: sexo) {
            return petSex.getSex()
        } else {
            return "Sei lá"
        }
    }
}

#Preview {
    PetDetailView(imageName: .image, petName: "Mite", descript: "Fujão", sexo: 3, birthdate: .now)
}

#Preview {
    PetView(name: "Mite", image: .image, descript: "Fujão", sexo: 3, birthdate: .now)
}

enum PetSex: Int {
    case male = 2
    case female = 3
    case dontKnow = 1
    
    func getSex() -> String {
        switch (self) {
        case .male:
            return "Macho"
        case .female:
            return "Fêmea"
        case .dontKnow:
            return "Não informado"
        }
    }
}
