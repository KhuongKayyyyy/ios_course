//
//  NavigationBar.swift
//  Weather
//
//  Created by Khương Kayyy on 11/01/2024.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var searchText: String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing :8){
            HStack{
                Button{
                    dismiss()
                } label :{
                    //MARK: - Back Button Icon
                    HStack(spacing: 5) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 23).weight(.medium))
                        .foregroundColor(.secondary)
                        
                        Text("Weather")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    .frame(height: 44)
                }
                
                Spacer()
                
                //MARK: - More Button
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 28))
                    .frame(width: 44,height: 44,alignment: .trailing)
            }
            .frame(height: 52)
            
            //MARK: - Search bar
            HStack(spacing : 2){
                Image(systemName: "magnifyingglass")
                TextField("Search for a city or airport", text:     $searchText)
            }
            .foregroundColor(.secondary)
            .padding(.horizontal, 6)
            .padding(.vertical, 7)
            .frame(height: 36, alignment:  .leading)
            .background(Color.bottomSheetBackground, in: RoundedRectangle(cornerRadius: 10))
            .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: .black.opacity(0.25),lineWidth: 2,offsetX: 0,offsetY: 2, blur: 2)
        }
        .frame(height: 106,alignment: .top)
        .backgroundBlur(radius: 20,opaque: true)
        .padding(.horizontal,16)
        .padding(.top,49)
        .background(Color.navBarBackground)
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationBar(searchText: .constant(""))
}
