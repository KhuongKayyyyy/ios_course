//
//  HomeView.swift
//  Weather
//
//  Created by Khương Kayyy on 10/01/2024.
//

import SwiftUI
import BottomSheet
enum BottomSheetPostition : CGFloat, CaseIterable{
    case top = 0.83
    case middle = 0.385
}
struct HomeView: View {
    @State var bottomSheetPosition : BottomSheetPostition = .middle
    @State var bottomSheetTranslation : CGFloat = BottomSheetPostition.middle.rawValue
    @State var hasDragged : Bool = false
    
    var bottomSheetTranslationProrated : CGFloat{
        (bottomSheetTranslation - BottomSheetPostition.middle.rawValue) / (BottomSheetPostition.top.rawValue - BottomSheetPostition.middle.rawValue )
    }
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                let imageOffset = screenHeight + 36
                
                ZStack{
                    
                    //MARK: - BackgroundColor
                    Color.background.ignoresSafeArea()
                    
                    //MARK: - Background Image
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(y: 
                            -bottomSheetTranslationProrated * imageOffset)
                    
                    //MARK: - House image
                    Image("House")
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 257)
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    //MARK: - Current Weather
                    VStack(spacing: -10 * (1 - bottomSheetTranslationProrated)){
                        Text("Montreal")
                            .font(.largeTitle)
                        
                        VStack{
                            Text(attributeString)
                            Text("H:24°   L:18°")
                                .font(.title3.weight((.semibold)))
                                .opacity(1 - bottomSheetTranslationProrated)
                        }
                        Spacer()
                    }
                    .padding(.top,51)
                    .offset(y : -bottomSheetTranslationProrated * 46)
                    
                    //MARK: - Bottom Sheet
                    BottomSheetView(position: $bottomSheetPosition) {
//                        Text(bottomSheetTranslationProrated.formatted())
                    } content: {
                        ForecastView(bottomSheetTranslationProrated: bottomSheetTranslationProrated)
                    }
                    .onBottomSheetDrag { translation in
                        bottomSheetTranslation = translation / screenHeight
                        withAnimation(.easeInOut){
                            if bottomSheetPosition == BottomSheetPostition.top{
                                hasDragged = true
                            }else{
                                hasDragged = false
                            }
                        }
                    }
                    
                    //MARK: - Tab bar
                    TabBar(action: {
                        bottomSheetPosition = .top
                    })
                    .offset(y: bottomSheetTranslationProrated * 115)
                }
                .navigationBarHidden(true)
            }
        }
    }
    private var attributeString : AttributedString{
        var string = AttributedString("19°" + (hasDragged ? " | " : "\n ") + "Mostly Clear")
        
        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size: (96 - (bottomSheetTranslationProrated * (96 - 20))), weight: hasDragged ? .semibold : .thin)
            string[temp].foregroundColor = hasDragged ? .secondary : .primary
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary.opacity(bottomSheetTranslationProrated)
        }
        
        if let weather = string.range(of: "Mostly Clear") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        return string
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
