//
//  EnterView.swift
//  PetTelas
//
//  Created by found on 23/01/25.
//

import SwiftUI

struct EnterView: View {
    @State var showSignInView = false
    var body: some View {
            if showSignInView {
                SignInView(show: $showSignInView)
            } else {
                VStack(spacing: 400) {
                    Text("Gerencie a vida do seu bichinho em um só lugar")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    
                    Button {
                        withAnimation {
                            showSignInView.toggle()
                        }
                    } label: {
                        Text("Vamos lá")
                            .foregroundStyle(.black)
                            .frame(width: 267, height: 50, alignment: .center)
                            .background(Color(red: 1, green: 0.91, blue: 0.49))
                            .cornerRadius(50)
                            .shadow(color: .black.opacity(0.04), radius: 7.9, x: 0, y: 4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .inset(by: 0.75)
                                    .stroke(Color(red: 1, green: 0.72, blue: 0.29), lineWidth: 1.5)
                                
                            )
                    }
                }
                .padding()
            }
        
    }
}

#Preview {
    EnterView()
        .environmentObject(PetViewModel())
        .accentColor(.yellow)
}

