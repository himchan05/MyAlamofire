//
//  ProfileImageView.swift
//  MyAlamofire
//
//  Created by 박힘찬 on 2022/03/25.
//

import SwiftUI
import Kingfisher

struct ProfileImageView: View {
    var Item: User
    
    var body: some View {
        HStack {
            KFImage(URL(string: Item.picture.medium)!)
                .resizable()
                .scaledToFill()
                .frame(width: 75, height: 75)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
            VStack(alignment: .leading, spacing: 0) {
                Divider().opacity(0)
                Text("[\(Item.name.title)] \(Item.name.first) \(Item.name.last)")
                    .font(.system(size: 20))
            }
        }
        .padding(5)
        .background(Color(#colorLiteral(red: 1, green: 0.9015766382, blue: 0.9088146091, alpha: 1)))
        .cornerRadius(15)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        var dummy = User(name: Name(title: "박", first: "힘찬", last: "이다"), picture: Picture(large: "https://randomuser.me/api/portraits/women/73.jpg", medium: "https://randomuser.me/api/portraits/women/73.jpg", thumbnail: "https://randomuser.me/api/portraits/women/73.jpg"))
        ProfileImageView(Item: dummy)
    }
}
