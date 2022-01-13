//
//  MyView.swift
//  swiftUIPractice
//
//  Created by SeongHoon Kim on 2022/01/12.
//

import SwiftUI

struct MyView: View {
    let helloFont: Font
    var body: some View {
        
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(helloFont)
            Text("만나서 반가워요.")
        }
            
        
        
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(helloFont: .title)
    }
}
