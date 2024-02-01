//
//  InfoView.swift
//  PersonalCard
//
//  Created by Khương Kayyy on 01/02/2024.
//

import SwiftUI

struct InfoView: View {
    var text: String
    var imageName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 60)
            .foregroundStyle(Color.white)
            .padding()
            .overlay {
                HStack {
                    Image(systemName: imageName)
                        .foregroundStyle(Color(UIColor(red: 1.00, green: 0.47, blue: 0.47, alpha: 1.00)))
                    Text(text)
                        .font(.system(size: 20))
                }
            }
    }
}

#Preview {
    InfoView(text: "+84 907 827 157", imageName: "phone.fill")
        .previewLayout(.sizeThatFits)
}
