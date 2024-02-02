//
//  DetailView.swift
//  H4X0R
//
//  Created by Khương Kayyy on 02/02/2024.
//

import SwiftUI
import WebKit
struct DetailView: View {
    let url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://dhwthompson.com/2019/my-favourite-git-commit")
}


