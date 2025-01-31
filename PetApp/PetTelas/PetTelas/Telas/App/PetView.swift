//
//  PetView.swift
//  PetTelas
//
//  Created by found on 24/01/25.
//

import SwiftUI

struct PetView: View {
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Mite")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundStyle(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 14)
            .frame(width: 320, height: 450, alignment: .bottomLeading)
            
            .background(
                Image(.mite)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 320, height: 450)
                    .clipped()
                    .opacity(0.9)
            )
            .cornerRadius(40)
            
            Spacer()
            
            //            Rectangle()
            //                .foregroundColor(.clear)
            //                .frame(width: 410, height: 40)
            //                .background(
            //                    LinearGradient(
            //                        stops: [
            //                            Gradient.Stop(color: Color(red: 1, green: 0.91, blue: 0.49), location: 0.00),
            //                            Gradient.Stop(color: Color(red: 1, green: 0.72, blue: 0.29), location: 1.00),
            //                        ],
            //                        startPoint: UnitPoint(x: 0.5, y: 0.5),
            //                        endPoint: UnitPoint(x: 0.5, y: -0.11)
            //                    )
            //                )
            //                .clipShape(RoundedRectangle(cornerRadius: 600))
            //                .ignoresSafeArea()
            //
            //            }
                
            
        }
    }
}

#Preview {
    PetView()
}

