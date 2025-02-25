//
//  ResumeViewModel.swift
//  Petnote
//
//  Created by João Marcelo Colombini Cardonha on 20/02/25.
//

import Foundation
import SwiftUI
import SwiftData

class ResumeViewModel: ObservableObject {
    @Published var consultasOrdenadas: [ConsultaDetalhada] = []
    @Published var vacinasOrdenadas: [DoseDetalhada] = []
    @Published var isAuthorized: Bool = false
    
    func atualizarVacinas(pets: [Pet]) async {
        var dosesTemp: [DoseDetalhada] = []
        
        for pet in pets {
            for vacina in pet.vacinas {
                for dose in vacina.doses {
                    if let image = UIImage(data: pet.imageURL) {
                        let doseDetalhada = DoseDetalhada(
                            nomeVacina: vacina.name,
                            dose: dose,
                            image: image
                        )
                        dosesTemp.append(doseDetalhada)
                    }
                }
            }
        }

        DispatchQueue.main.async {
            self.vacinasOrdenadas = dosesTemp.sorted { $0.dose.data < $1.dose.data }
        }
    }
    
    func atualizarConsultas(pets: [Pet]) async {
        var consultas: [ConsultaDetalhada] = []
        
        for pet in pets {
            for consulta in pet.consultas {
                if let image = UIImage(data: pet.imageURL) {
                    let consultaDetalhada = ConsultaDetalhada(title: consulta.title, data: consulta.data, location: consulta.location, image: image)
                    consultas.append(consultaDetalhada)
                }
            }
        }
        DispatchQueue.main.async {
            self.consultasOrdenadas = consultas.sorted { $0.data < $1.data }
        }
    }
}
