//
//  ContentView.swift
//  PetTelas
//
//  Created by found on 21/01/25.
//

import SwiftUI

struct SignInView: View {
    @State private var showTabView = false
    @State var textEmail = ""
    @State var textPassword = ""
    @State var isPasswordVisible = false
    @State var isFormCompleted = false
    var body: some View {
        NavigationStack {
            if showTabView {
                MainTabView(show: $showTabView)
            } else {
                ZStack {
                    LinearGradient(stops: [
                        Gradient.Stop(color: Color(red: 1, green: 0.91, blue: 0.49), location: 0.00),
                        Gradient.Stop(color: Color(red: 1, green: 0.72, blue: 0.29), location: 1.00),
                    ],startPoint: UnitPoint(x: 0.5, y: 0),endPoint: UnitPoint(x: 0.5, y: 1)
                    )
                    .ignoresSafeArea()
                    
                    //Main VStack
                    VStack(spacing: 40) {
                        
                        Spacer().frame(height: 120)
                        
                        VStack(alignment: .center, spacing: 2) {
                            Text("Bem-vindo")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                            Text("Entre na sua conta!")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                            
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 398, height: 600)
                                .background(.white)
                                .cornerRadius(60)
                                .shadow(color: .black.opacity(0.01), radius: 25.15, x: 0, y: 0)
                            
                            VStack(spacing: 30) {
                                
                                TextFieldComponent(title: "Email", textFieldTitle: "", textInput: $textEmail)
                                VStack(alignment: .leading) {
                                    
                                    HStack {
                                        Text("Confirme sua senha")
                                            .fontWeight(.medium)
                                            
                                        Spacer()
                                        
                                        Button {
                                            isPasswordVisible.toggle()
                                        } label: {
                                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                                .foregroundStyle(.black)
                                        }
                                    }
                                    .padding(.horizontal)
                                    
                                    if isPasswordVisible {
                                        TextField("", text: $textPassword)
                                            .padding(.horizontal)
                                            .padding(.vertical, 15.1)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 22)
                                                    .stroke(Color(red: 1, green: 0.91, blue: 0.49), lineWidth: 1.5)
                                            }
                                        
                                    } else {
                                        SecureField("", text: $textPassword)
                                            .padding()
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 22)
                                                    .stroke(Color(red: 1, green: 0.91, blue: 0.49), lineWidth: 1.5)
                                            }
                                    }
                                    

                                }
                                
                                Button {
                                    withAnimation(.snappy) {
                                        showTabView.toggle()
                                    }
                                    
                                } label: {
                                    Text("Entrar")
                                        .frame(width: 300, height: 60)
                                        .foregroundStyle(!textEmail.isEmpty && !textPassword.isEmpty && textPassword.count > 7 ? .black : Color(red: 0.75, green: 0.75, blue: 0.75))
                                        .fontWeight(.semibold)
                                        .background {
                                            if !textEmail.isEmpty && !textPassword.isEmpty && textPassword.count > 7{
                                                LinearGradient(
                                                    stops: [
                                                        Gradient.Stop(color: Color(red: 1, green: 0.91, blue: 0.49), location: 0.00),
                                                        Gradient.Stop(color: Color(red: 1, green: 0.65, blue: 0.2), location: 1.00),
                                                    ],
                                                    startPoint: UnitPoint(x: 0.5, y: -0.16),
                                                    endPoint: UnitPoint(x: 0.5, y: 1.43)
                                                )
                                            } else {
                                                LinearGradient(
                                                stops: [
                                                Gradient.Stop(color: .white, location: 0.17),
                                                Gradient.Stop(color: Color(red: 0.85, green: 0.85, blue: 0.85), location: 1.00),
                                                ],
                                                startPoint: UnitPoint(x: 0.5, y: -1),
                                                endPoint: UnitPoint(x: 0.5, y: 1.43)
                                                )
                                            }
                                            
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 22))
                                        
                                }

                                
                                Spacer()
                                
                                VStack(alignment: .center, spacing: 10) {
                                    Text("Não tem uma conta?")
                                        .font(.title3)
                                    
                                    NavigationLink(destination: SignUpview().toolbar(.hidden)) {
                                        Text("Cadastre-se aqui")
                                            .foregroundStyle(Color(red: 1, green: 0.65, blue: 0))
                                            .fontWeight(.semibold)
                                            .underline()
                                            
                                    }
                                }
                                
                                Spacer()
                                
                            }
                            .padding(50)
                            
                        }
                    }
                    
                    
                    
                }
            }
        }
        
    }
}

struct TextFieldComponent: View {
    let title: String
    let textFieldTitle: String
    @Binding var textInput: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.medium)
                .padding(.horizontal)
            
            TextField(textFieldTitle, text: $textInput)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(Color(red: 1, green: 0.91, blue: 0.49), lineWidth: 1.5)
                }
        }
    }
}

#Preview {
    SignInView()
}
