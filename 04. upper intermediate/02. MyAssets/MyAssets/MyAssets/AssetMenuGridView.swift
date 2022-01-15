//
//  AssetMenuGridView.swift
//  MyAssets
//
//  Created by SeongHoon Kim on 2022/01/15.
//

import SwiftUI

struct AssetMenuGridView: View {
    let MenuList: [[AssetMenu]] = [
        [.creditScore, .bankAccount, .investment, .loan],
        [.insurance, .creditCard, .cash, .realEstate]
    ]
    var body: some View {
        VStack(spacing: 20) {
            ForEach(MenuList, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row) { menu in
                        Button("") {
                            print("\(menu.title)버튼 tapped")
                        }
                        .buttonStyle(AssetMenuButtonStyle(menu: menu))
                        
                    }
                }
            }
        }
    }
}

struct AssetMenuGridView_Previews: PreviewProvider {
    static var previews: some View {
        AssetMenuGridView()
    }
}
