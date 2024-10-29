//
//  ContentView.swift
//  WeatherApp
//
//  Created by João Marcelo Colombini Cardonha on 27/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack { // Cria uma stack vertical para o texto da cidade
                CityTextView(cityName: "Fortaleza, CE")
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 29)
                
                HStack (spacing: 20){
                    WeatherDayView(dayOfWeek: "TER", imageName: "cloud.sun.fill", dayTemperature: 28)
                    WeatherDayView(dayOfWeek: "QUA", imageName: "sun.max.fill", dayTemperature: 31)
                    WeatherDayView(dayOfWeek: "QUI", imageName: "wind", dayTemperature: 27)
                    WeatherDayView(dayOfWeek: "SEX", imageName: "sunset.fill", dayTemperature: 25)
                    WeatherDayView(dayOfWeek: "SÁB", imageName: "moon.stars.fill" , dayTemperature: 24)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                    print("tapped")
                } label: {
                    WeatherButton(title: "Mudar horário",
                                  textColor: isNight ? .white : .blue,
                                  backgroundColor: isNight ? Color("OpaqueBlack") : .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var dayTemperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(dayTemperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("LightBlue")]),
//                       startPoint: .top,
//                       endPoint: .bottom)
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) { // vstack que contem a foto do clima e temp, add param de espaçamento
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

//struct WeatherButton: View {
//    var title: String
//    var textColor: Color
//    var backgroundColor: Color
//    
//    var body: some View {
//        Text(title)
//            .frame(width: 280, height: 50)
//            .background(backgroundColor)
//            .foregroundColor(textColor)
//            .font(.system(size: 20, weight: .bold, design: .default))
//            .cornerRadius(10.0)
//    }
//}
