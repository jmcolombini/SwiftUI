//
//  FirstScreenView.swift
//  PetTelas
//
//  Created by found on 04/02/25.
//

import SwiftUI

struct FirstScreenView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    Text("Pular")
                        .foregroundStyle(.orange)
                        .bold()
                }
                .padding(.horizontal)
                
                VStack(spacing: 56) {
                    Text("Gerencie a vida do seu bichinho em um só lugar")
                        .font(.system(size: 28, weight: .medium))
                        .multilineTextAlignment(.center)
                    
                    VStack(spacing: 36) {
                        HStack {
                            Spacer()
                            Image(.preview3)
                                .resizable()
                                .frame(width: 300, height: 430)
                                .aspectRatio(contentMode: .fit)
                                
                        }
                        .overlay{
                            RoundedRectangle(cornerRadius: 15)
                                .inset(by: 0.5)
                                .stroke(Color(red: 1, green: 0.72, blue: 0.29), lineWidth: 1)
                            
                        }
                        NavigationLink {
                            PickPetView()
                        } label: {
                            Text("Vamos lá!")
                                .font(.system(size: 18, weight: .medium))
                                .frame(width: 300, height: 50)
                                .foregroundStyle(.black)
                                .background(Color(red: 1, green: 0.91, blue: 0.49))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 50)
                                        .inset(by: 0.75)
                                        .stroke(Color(red: 1, green: 0.72, blue: 0.29), lineWidth: 1.5)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 40))
                        }
                    }
                    
                }
                .padding(.horizontal, 45)
            }
        }
    }
}

#Preview {
    FirstScreenView()
        .environmentObject(PetViewModel())
}

struct PickPetView: View {
    @State private var showTabView = false
    var body: some View {
        if showTabView {
            MainTabView(show: $showTabView)
        } else {
            NavigationStack {
                VStack(spacing: 110) {
                    VStack(spacing: 57) {
                        Text("Qual seu bichinho?")
                            .font(.system(size: 28, weight: .medium))
                            .multilineTextAlignment(.center)
                        VStack(spacing: 17) {
                            HStack(spacing: 17) {
                                ExtractedView()
                                ExtractedView()
                            }
                            HStack(spacing: 17) {
                                ExtractedView()
                                ExtractedView()
                            }
                            HStack {
                                Spacer()
                                Image(systemName: "circle")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .fontWeight(.ultraLight)
                                Spacer()
                            }
                        }
                    }
                    Button {
                        withAnimation {
                            showTabView.toggle()
                        }
                    } label: {
                        Text("Continuar")
                            .font(.system(size: 18, weight: .medium))
                            .frame(width: 300, height: 50)
                            .foregroundStyle(.black)
                            .background(Color(red: 1, green: 0.91, blue: 0.49))
                            .overlay {
                                RoundedRectangle(cornerRadius: 50)
                                    .inset(by: 0.75)
                                    .stroke(Color(red: 1, green: 0.72, blue: 0.29), lineWidth: 1.5)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                    }
                    
                }
            }
        }
       
    }
}

#Preview {
    PickPetView()
        .environmentObject(PetViewModel())
}

struct ExtractedView: View {
    var body: some View {
        VStack {
            Image(systemName: "circle")
                .resizable()
                .frame(width: 100, height: 100)
                .fontWeight(.ultraLight)
            Text("Pet")
                .font(.system(size: 22))
        }
    }
}
