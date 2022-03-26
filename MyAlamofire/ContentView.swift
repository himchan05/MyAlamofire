//
//  ContentView.swift
//  MyAlamofire
//
//  Created by 박힘찬 on 2022/03/25.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @ObservedObject var randomusers = ViewModel()
    
    var body: some View {
        VStack {
            Text(" \(randomusers.viewmodel.count) 명의 랜덤 프로필")
            ScrollView {
                ForEach(randomusers.viewmodel, id: \.self) { user in
                    ProfileImageView(Item: user)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
