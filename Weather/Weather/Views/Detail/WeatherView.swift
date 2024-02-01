//
//  WeatherView.swift
//  Weather
//
//  Created by Khương Kayyy on 11/01/2024.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchText = ""
    
    var searchResults: [Forecast]{
        if searchText.isEmpty{
            return Forecast.cities
        }else{
            return Forecast.cities.filter{ $0.location.contains(searchText)}
        }
    }
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            
            //MARK: - Weather Widget
            
            ScrollView(showsIndicators: false){
                VStack(spacing: 20){
                    ForEach(Forecast.cities){
                        forecast in WeatherWidget(forecast: forecast)
                    }
                }
            }
            .safeAreaInset(edge: .top){
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay{
            //MARK: - Navigationbar
            NavigationBar(searchText: $searchText)
        }
        .navigationBarHidden(true)
//        .searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always),prompt: "Search for a city or airport")
    }
}

#Preview {
    NavigationView {
        WeatherView()
    }
}
