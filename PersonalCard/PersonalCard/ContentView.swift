//
//  ContentView.swift
//  PersonalCard
//
//  Created by Khương Kayyy on 01/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(UIColor(red: 1.00, green: 0.47, blue: 0.47, alpha: 1.00))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("h1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200,height: 200)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                
                Text("Nguyễn Đạt Khương")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                
                Text("IOS Developper")
                    .foregroundStyle(.white)
                    .font(.system(size: 30))
                
                Divider()
                
                
                InfoView(text: "+84 907 827 157", imageName: "phone.fill")
                
                InfoView(text: "zzkhngzz@gmail.com", imageName: "envelope.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}
