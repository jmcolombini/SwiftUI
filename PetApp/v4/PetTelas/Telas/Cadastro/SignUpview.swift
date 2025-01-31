//
//  SignUpview.swift
//  PetTelas
//
//  Created by found on 21/01/25.
//

import SwiftUI

struct SignUpview: View {
    @State var textEmail = ""
    @State var textPassword = ""
    @State var confirmTextPassword = ""
    @State var username = ""
    @State private var isPasswordVisible = false
    @State private var isConfirmPasswordVisible = false
    @State var showSignInView = false
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(stops: [
                    Gradient.Stop(color: Color(red: 1, green: 0.91, blue: 0.49), location: 0.00),
                    Gradient.Stop(color: Color(red: 1, green: 0.72, blue: 0.29), location: 1.00),
                ],startPoint: UnitPoint(x: 0.5, y: 0),endPoint: UnitPoint(x: 0.5, y: 1)
                )
                .ignoresSafeArea()
                
                //Main VStack
                VStack(spacing: 40) {
                    
                    Spacer().frame(height: 150)
                    
                    
                    
                    
                    Text("Cadastre-se")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 398, height: 800)
                            .background(.white)
                            .cornerRadius(60)
                            .shadow(color: .black.opacity(0.01), radius: 25.15, x: 0, y: 0)
                        
                        VStack(spacing: 25) {
                            TextFieldComponent(title: "Insira seu nome", textFieldTitle: "", textInput: $username)
                            TextFieldComponent(title: "Insira seu email", textFieldTitle: "", textInput: $textEmail)
                            
                            VStack(alignment: .leading) {
                                
                                HStack {
                                    Text("Crie sua senha")
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

                            VStack(alignment: .leading) {
                                
                                HStack {
                                    Text("Confirme sua senha")
                                        .fontWeight(.medium)
                                        
                                    Spacer()
                                    
                                    Button {
                                        isConfirmPasswordVisible.toggle()
                                    } label: {
                                        Image(systemName: isConfirmPasswordVisible ? "eye.slash" : "eye")
                                            .foregroundStyle(.black)
                                    }
                                }
                                .padding(.horizontal)
                                
                                if isConfirmPasswordVisible {
                                    TextField("", text: $confirmTextPassword)
                                        .padding(.horizontal)
                                        .padding(.vertical, 15.1)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 22)
                                                .stroke(Color(red: 1, green: 0.91, blue: 0.49), lineWidth: 1.5)
                                        }
                                    
                                } else {
                                    SecureField("", text: $confirmTextPassword)
                                        .padding()
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 22)
                                                .stroke(Color(red: 1, green: 0.91, blue: 0.49), lineWidth: 1.5)
                                        }
                                }
                                

                            }
                            
                            Button {
                                print("Cadastrar")
                            } label: {
                                Text("Cadastrar")
                                    .frame(width: 300, height: 50)
                                    .foregroundStyle(!username.isEmpty && !textEmail.isEmpty && !textPassword.isEmpty && !confirmTextPassword.isEmpty && textPassword.count > 7 ? .black : Color(red: 0.75, green: 0.75, blue: 0.75))
                                    .fontWeight(.semibold)
                                    .background(
                                        LinearGradient(
                                        stops: [
                                        Gradient.Stop(color: Color(red: 1, green: 0.91, blue: 0.49), location: 0.00),
                                        Gradient.Stop(color: Color(red: 1, green: 0.65, blue: 0.2), location: 1.00),
                                        ],
                                        startPoint: UnitPoint(x: 0.5, y: -0.16),
                                        endPoint: UnitPoint(x: 0.5, y: 1.43)
                                        )
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 22))
                            }
                            
                            
                            VStack(alignment: .center, spacing: 10) {
                                Text("Já tem uma conta?")
                                    .font(.title3)
                                
                                NavigationLink(destination: SignInView(show: $showSignInView).toolbar(.hidden)) {
                                    Text("Faça login")
                                        .foregroundStyle(Color(red: 1, green: 0.65, blue: 0))
                                        .fontWeight(.semibold)
                                        .underline()
                                        
                                }
                            }
                            .padding()
                            
                            Spacer()
                            
                        }
                        .padding(50)
                        
                    }
                }
                
                
                
            }
        }
    }
}

#Preview {
    SignUpview()
}
