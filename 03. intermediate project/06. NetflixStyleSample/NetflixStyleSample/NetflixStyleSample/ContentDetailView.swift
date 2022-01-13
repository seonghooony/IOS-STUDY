//
//  ContentDetailView.swift
//  NetflixStyleSample
//
//  Created by SeongHoon Kim on 2022/01/13.
//

import SwiftUI

struct ContentDetailView: View {
    @State var item: Item?
    
    var body: some View {
        VStack {
            if let item = item {
                Image(uiImage: item.image)
                    .aspectRatio(contentMode: .fit)
                Text(item.description).font(.caption).fontWeight(.semibold).multilineTextAlignment(.center).padding()
            } else {
                Color.white
            }
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let item0 = Item(description: "흥미진진, 판타지, 애니메이션, 엑션, 멀티캐스팅", imageName: "poster0")
        ContentDetailView(item: item0)
    }
}
